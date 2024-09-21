import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BannerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background pattern
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFD2D2D2),
              backgroundBlendMode: BlendMode.srcOver,
            ),
            child: CustomPaint(
              size: MediaQuery.of(context).size,
              painter: GridPainter(),
            ),
          ),
          // Banner with rotating images
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  width: 200,
                  height: 250,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform(
                        alignment: FractionalOffset.center,
                        transform: Matrix4.identity()
                          ..setEntry(1, 3, 0.005)
                          ..rotateX(math.pi / -8)
                          ..rotateY(_controller.value * 1.5 * math.pi),
                        child: Stack(
                          children: List.generate(10, (index) {
                            return RotatingItem(
                              index: index,
                              totalItems: 10,
                              image:
                                  'https://i.pinimg.com/564x/17/1a/30/171a30a079683e5006ad867d3694eee1.jpg',
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                // Content Text
                // BannerContent(),
              ],
            ),
          ),
          Align(alignment: Alignment.center, child: BannerContent()),
        ],
      ),
    );
  }
}

class RotatingItem extends StatelessWidget {
  final int index;
  final int totalItems;
  final String image;

  RotatingItem({
    required this.index,
    required this.totalItems,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final angle = 1.5 * math.pi / totalItems * index;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateY(angle)
        ..translate(0.0, 0.0, 540.0),
      child: Container(
        width: 150,
        height: 200,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BannerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Story',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Color(0xFF25283B),
          ),
        ),
        SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Funtastic stories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Welcome to our app',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 8),
            Text(
              'Explore our app',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(height: 64),
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Color(0xFF25283B).withOpacity(0.13)
      ..strokeWidth = 1.0;

    double step = 100;
    for (double i = 0; i <= size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), linePaint);
    }
    for (double i = 0; i <= size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
