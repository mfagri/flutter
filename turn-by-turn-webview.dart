
class NavigationPage extends StatefulWidget {
  final double destinationLat;
  final double destinationLng;

  const NavigationPage({
    Key? key,
    required this.destinationLat,
    required this.destinationLng,
  }) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late final WebViewController _controller;
  Timer? _locationTimer;
  String? _htmlContent;

  @override
  void initState() {
    super.initState();
    _loadHtmlFromAssets();
    _initWebView();
    log('NavigationPage initialized');
    _startLocationUpdates();
  }

  Future<void> _loadHtmlFromAssets() async {
    _htmlContent = await rootBundle.loadString('lib/assets/navigation.html');
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadHtmlString('''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turn-by-Turn Navigation</title>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/mapbox-gl/2.15.0/mapbox-gl.js'></script>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/mapbox-gl/2.15.0/mapbox-gl.css' rel='stylesheet' />
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        #map {
            height: 100vh;
            width: 100%;
            position: relative;
        }
        #navigation-panel {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 300px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px;
            max-height: 80vh;
            overflow-y: auto;
            transition: transform 0.3s ease;
        }
        
        #toggle-panel {
            display: none;
            position: absolute;
            top: 20px;
            right: 20px;
            background: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 1000;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            #navigation-panel {
                position: fixed;
                top: auto;
                bottom: 0;
                right: 0;
                left: 0;
                width: 100%;
                max-height: 50vh;
                border-radius: 20px 20px 0 0;
                transform: translateY(0);
                z-index: 1000;
            }
            
            #navigation-panel.collapsed {
                transform: translateY(calc(100% - 60px));
            }
            
            .start-nav-btn {
                max-width: 2400px;
                margin: 0 auto 15px;
            }
            
            #toggle-panel {
                display: block;
            }

            #current-instruction {
                bottom: calc(50vh + 10px);
                width: 80%;
                font-size: 16px;
            }
        }
        #current-instruction {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            background: white;
            padding: 15px 25px;
            border-radius: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            z-index: 1000;
        }
        .instruction {
            padding: 12px;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
        }
        .instruction.active {
            background: #f0f7ff;
            border-left: 4px solid #0066cc;
        }
        .instruction-icon {
            width: 30px;
            height: 30px;
            background: #0066cc;
            border-radius: 50%;
            margin-right: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .start-nav-btn {
            background: #0066cc;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            margin-bottom: 15px;
        }
        .start-nav-btn:hover {
            background: #0052a3;
        }
        .distance-time {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
        }
        .navigation-controls {
            position: absolute;
            bottom: 100px;
            right: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .control-btn {
            background: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #rerouting-alert {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0,0,0,0.8);
            color: white;
            padding: 15px 30px;
            border-radius: 25px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <button id="toggle-panel" onclick="togglePanel()">↑</button>
    <div id="map"></div>
    <div id="navigation-panel">
        <button class="start-nav-btn" onclick="startNavigation()">Start Navigation</button>
        <div class="distance-time">
            <div id="eta"></div>
            <div id="distance"></div>
        </div>
        <div id="instructions-list"></div>
    </div>
    <div id="current-instruction"></div>
    <div class="navigation-controls">
        <button class="control-btn" onclick="toggleVoiceGuidance()">🔊</button>
        <button class="control-btn" onclick="recenterMap()">⌖</button>
    </div>
    <div id="rerouting-alert">Recalculating route...</div>

    <script>
        let map;
        let userMarker;
        let navigationStarted = false;
        let voiceGuidanceEnabled = true;
        
        // Initialize speech synthesis
        const synth = window.speechSynthesis;
        let currentInstructionIndex = 0;

        function speak(text) {
            if (voiceGuidanceEnabled) {
                const utterance = new SpeechSynthesisUtterance(text);
                utterance.rate = 0.9;
                utterance.pitch = 1;
                synth.speak(utterance);
            }
        }

        // Initialize map
        function initMap() {
            mapboxgl.accessToken = 'pk.eyJ1IjoibWZhZ3JpIiwiYSI6ImNscWpzZmtqZzA4YXQya3A5Nzk1YzdvcDIifQ.o2NsYWhK68aW_UmcNvCYeg';
            
            map = new mapboxgl.Map({
                container: 'map',
                style: 'mapbox://styles/mapbox/navigation-day-v1',
                center: [-6.8928163, 32.8678029],
                zoom: 15,
                pitch: 60
            });

            // Add navigation controls
            map.addControl(new mapboxgl.NavigationControl());

            // Initialize user location marker
            userMarker = new mapboxgl.Marker({
                color: '#0066cc'
            });

            // Start watching user location
            if (navigator.geolocation) {
                navigator.geolocation.watchPosition(updateUserLocation, null, {
                    enableHighAccuracy: true,
                    maximumAge: 0,
                    timeout: 5000
                });
            }

            // Add route to map
            addRoute();
        }

        function updateUserLocation(position) {
            const { latitude, longitude } = position.coords;
            userMarker.setLngLat([longitude, latitude]).addTo(map);
            
            if (navigationStarted) {
                // Update current step based on user location
                updateCurrentStep([longitude, latitude]);
                // Check if user is off route
                checkRouteDeviation([longitude, latitude]);
                // Update ETA and remaining distance
                updateNavigationInfo([longitude, latitude]);
            }
        }

        function updateCurrentStep(userLocation) {
            if (!window.routeData || !navigationStarted) return;

            const steps = window.routeData.legs[0].steps;
            const currentStepIndex = window.currentStepIndex;

            // Find the nearest step to the user's location
            let minDistance = Infinity;
            let nearestStepIndex = currentStepIndex;

            for (let i = currentStepIndex; i < steps.length; i++) {
                const step = steps[i];
                const stepLocation = step.maneuver.location;
                const distance = calculateDistance(
                    userLocation[1], userLocation[0],
                    stepLocation[1], stepLocation[0]
                );

                if (distance < minDistance) {
                    minDistance = distance;
                    nearestStepIndex = i;
                }
            }

            // If we're close to the next step
            if (minDistance < 0.02 && nearestStepIndex > window.currentStepIndex) { // 20 meters threshold
                window.currentStepIndex = nearestStepIndex;
                const nextStep = steps[nearestStepIndex];
                
                // Update UI and speak instruction
                document.getElementById('current-instruction').textContent = nextStep.maneuver.instruction;
                speak(nextStep.maneuver.instruction);

                // Highlight current step in the list
                const instructions = document.querySelectorAll('.instruction');
                instructions.forEach((inst, index) => {
                    inst.classList.toggle('active', index === nearestStepIndex);
                });
            }
        }

        function calculateDistance(lat1, lon1, lat2, lon2) {
            const R = 6371; // Earth's radius in km
            const dLat = (lat2 - lat1) * Math.PI / 180;
            const dLon = (lon2 - lon1) * Math.PI / 180;
            const a = 
                Math.sin(dLat/2) * Math.sin(dLat/2) +
                Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) * 
                Math.sin(dLon/2) * Math.sin(dLon/2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
            return R * c;
        }
        //32.882412,-6.89774
       //32.8824078,-6.8977927
        function addRoute() {
            //const start = [-6.8928163, 32.8678029];
           
            //const end = [-6.8996641, 32.8822962];
            const start = [ -6.8977927,32.8824078];
            const end = [ -6.89774,32.882412];

            // Fetch route when map is loaded
            map.on('load', () => {
                // Get route using Mapbox Directions API
                fetch(`https://api.mapbox.com/directions/v5/mapbox/driving/\${start[0]},\${start[1]};\${end[0]},\${end[1]}?steps=true&geometries=geojson&access_token=pk.eyJ1IjoibWZhZ3JpIiwiYSI6ImNscWpzZmtqZzA4YXQya3A5Nzk1YzdvcDIifQ.o2NsYWhK68aW_UmcNvCYeg`)
                    .then(response => response.json())
                    .then(json => {
                        const data = json.routes[0];
                        const route = data.geometry.coordinates;
                        
                        // Save the route instructions
                        window.routeInstructions = data.legs[0].steps.map(step => step.maneuver.instruction);

                        // Add route source and layer if they don't exist
                        if (!map.getSource('route')) {
                            map.addSource('route', {
                                type: 'geojson',
                                data: {
                                    type: 'Feature',
                                    properties: {},
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: route
                                    }
                                }
                            });

                            map.addLayer({
                                id: 'route',
                                type: 'line',
                                source: 'route',
                                layout: {
                                    'line-join': 'round',
                                    'line-cap': 'round'
                                },
                                paint: {
                                    'line-color': '#0066cc',
                                    'line-width': 8,
                                    'line-opacity': 0.8
                                }
                            });
                        } else {
                            // Update existing route
                            map.getSource('route').setData({
                                type: 'Feature',
                                properties: {},
                                geometry: {
                                    type: 'LineString',
                                    coordinates: route
                                }
                            });
                        }

                        // Fit the map to the route
                        const bounds = new mapboxgl.LngLatBounds(
                            route[0],
                            route[0]
                        );
                        
                        route.forEach(point => {
                            bounds.extend(point);
                        });
                        
                        map.fitBounds(bounds, {
                            padding: 50
                        });
                    })
                    .catch(error => {
                        console.error('Error fetching route:', error);
                    });
            });
        }

        function startNavigation() {
            navigationStarted = true;
            document.querySelector('.start-nav-btn').textContent = 'Navigation Active';
            document.querySelector('.start-nav-btn').style.background = '#00cc66';
            
            // Use the real route instructions from Mapbox
            const instructions = window.routeInstructions || [
                'Calculating route...'
            ];

            const instructionsList = document.getElementById('instructions-list');
            instructions.forEach((instruction, index) => {
                const div = document.createElement('div');
                div.className = 'instruction';
                div.innerHTML = `
                    <div class="instruction-icon">\${index + 1}</div>
                    <div>\${instruction}</div>
                `;
                instructionsList.appendChild(div);
            });

            // Show and speak current instruction
            document.getElementById('current-instruction').textContent = instructions[0];
            speak(instructions[0]);
            
            // Initialize navigation info
            updateNavigationInfo();
        }

        function updateNavigationInfo(userLocation) {
            // Update ETA and distance (simulated)
            document.getElementById('eta').textContent = 'ETA: 5 mins';
            document.getElementById('distance').textContent = 'Remaining: 1.2 km';
        }

        function checkRouteDeviation(userLocation) {
            // Simulate route deviation check
            const offRoute = false;
            if (offRoute) {
                document.getElementById('rerouting-alert').style.display = 'block';
                speak("Recalculating route");
                // Recalculate route
                setTimeout(() => {
                    document.getElementById('rerouting-alert').style.display = 'none';
                }, 3000);
            }
        }

        function toggleVoiceGuidance() {
            voiceGuidanceEnabled = !voiceGuidanceEnabled;
            const button = document.querySelector('.control-btn');
            button.textContent = voiceGuidanceEnabled ? '🔊' : '🔇';
            
            // Speak status change
            if (voiceGuidanceEnabled) {
                speak("Voice guidance enabled");
            }
        }

        function recenterMap() {
            if (userMarker) {
                const userLocation = userMarker.getLngLat();
                map.flyTo({
                    center: [userLocation.lng, userLocation.lat],
                    zoom: 16,
                    pitch: 60
                });
            }
        }

        function togglePanel() {
            const panel = document.getElementById('navigation-panel');
            const button = document.getElementById('toggle-panel');
            panel.classList.toggle('collapsed');
            button.textContent = panel.classList.contains('collapsed') ? '↑' : '↓';
        }

        // Initialize the map
        initMap();
        
        // Set initial panel state on mobile
        if (window.innerWidth <= 768) {
            document.getElementById('navigation-panel').classList.add('collapsed');
        }
    </script>
    <script>
    let map;
    let userMarker;

    // Initialize the map
    function initMap() {
        mapboxgl.accessToken = 'YOUR_MAPBOX_ACCESS_TOKEN';
        map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/navigation-day-v1',
            center: [-6.8977927, 32.8824078], // Default center32.8824078,-6.8977927
            zoom: 15,
            pitch: 60
        });

        // Initialize user location marker
        userMarker = new mapboxgl.Marker({
            color: '#0066cc' // Blue marker
        });

        // Listen for location updates from Flutter
        window.addEventListener('message', (event) => {
            const data = JSON.parse(event.data);

            // Handle location update
            if (data.type === 'updateLocation') {
                const { lat, lng } = data;
                updateUserLocation({ coords: { latitude: lat, longitude: lng } });
            }

            // Handle route calculation
            if (data.type === 'calculateRoute') {
                const { startLat, startLng, endLat, endLng } = data;
                addRoute([startLng, startLat], [endLng, endLat]);
            }
        });
    }

    // Update user location on the map
    function updateUserLocation(position) {
        const { latitude, longitude } = position.coords;

        // Update the marker position
        userMarker.setLngLat([longitude, latitude]).addTo(map);

        // Center the map on the user's location
        map.flyTo({
            center: [longitude, latitude],
            zoom: 16,
            pitch: 60
        });

        // If navigation is active, update the current step and check for route deviation
        if (navigationStarted) {
            updateCurrentStep([longitude, latitude]);
            checkRouteDeviation([longitude, latitude]);
            updateNavigationInfo([longitude, latitude]);
        }
    }

    // Initialize the map when the page loads
    initMap();
</script>
<script>
    let map;
    let userMarker;

    // Initialize the map
    function initMap() {
        mapboxgl.accessToken = 'YOUR_MAPBOX_ACCESS_TOKEN';
        map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/navigation-day-v1',
            center: [-6.8977927, 32.8824078], // Default center
            zoom: 15,
            pitch: 60
        });

        // Initialize user location marker
        userMarker = new mapboxgl.Marker({
            color: '#0066cc' // Blue marker
        });

        // Listen for location updates from Flutter
        window.addEventListener('message', (event) => {
            const data = JSON.parse(event.data);

            // Handle location update
            if (data.type === 'updateLocation') {
                const { lat, lng } = data;
                updateUserLocation({ coords: { latitude: lat, longitude: lng } });
            }

            // Handle route calculation
            if (data.type === 'calculateRoute') {
                const { startLat, startLng, endLat, endLng } = data;
                addRoute([startLng, startLat], [endLng, endLat]);
            }
        });
    }

    // Update user location on the map
    function updateUserLocation(position) {
        const { latitude, longitude } = position.coords;

        // Update the marker position
        userMarker.setLngLat([longitude, latitude]).addTo(map);

        // Center the map on the user's location
        map.flyTo({
            center: [longitude, latitude],
            zoom: 16,
            pitch: 60
        });

        // If navigation is active, update the current step and check for route deviation
        if (navigationStarted) {
            updateCurrentStep([longitude, latitude]);
            checkRouteDeviation([longitude, latitude]);
            updateNavigationInfo([longitude, latitude]);
        }
    }

    // Initialize the map when the page loads
    initMap();
</script>
    
</body>
</html>
      ''')
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            _getCurrentLocation().then((position) {
              if (position != null) {
                _calculateRoute(
                  position.latitude,
                  position.longitude,
                  widget.destinationLat,
                  widget.destinationLng,
                );
              }
            });
          },
        ),
      );
  }

  void _startLocationUpdates() {
    _locationTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      final position = await _getCurrentLocation();
      if (position != null) {
        _updateLocation(position.latitude, position.longitude);
      }
    });
  }

  Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  void _updateLocation(double lat, double lng) {
    final message = jsonEncode({
      'type': 'updateLocation',
      'lat': lat,
      'lng': lng,
    });
    _controller.runJavaScript('window.postMessage(\'$message\', "*")');
  }

  void _calculateRoute(
      double startLat, double startLng, double endLat, double endLng) {
    final message = jsonEncode({
      'type': 'calculateRoute',
      'startLat': 32.8824078,
      'startLng': -6.8977927,
      'endLat': 32.882412,
      'endLng': -6.89774,
      //32.882412,-6.89774
      //32.8824078,-6.8977927
    });
    _controller.runJavaScript('window.postMessage(\'$message\', "*")');
  }

  @override
  void dispose() {
    _locationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _getCurrentLocation().then((position) {
                if (position != null) {
                  _calculateRoute(
                    position.latitude,
                    position.longitude,
                    widget.destinationLat,
                    widget.destinationLng,
                  );
                }
              });
            },
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
