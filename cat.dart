import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MazeGame());
}

class MazeGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Maze Adventure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  static const int PIXEL_SIZE = 20;
  static const int GRID_WIDTH = 50;  // Increased map size
  static const int GRID_HEIGHT = 50; // Increased map size
  static const int VISIBLE_TILES_X = 15; // Number of tiles visible horizontally
  static const int VISIBLE_TILES_Y = 15; 

    List<List<int>> maze = List.generate(GRID_HEIGHT, (_) => List.filled(GRID_WIDTH, 1));
  int playerX = 1;
  int playerY = 1;
  int exitX = GRID_WIDTH - 2;
  int exitY = GRID_HEIGHT - 2;
  int score = 0;
  int currentLevel = 1;
  int totalCoins = 0;
  List<Enemy> enemies = [];
  bool isPlayerMoving = false;
  Direction playerDirection = Direction.down;
  late AnimationController _animationController;
  late Timer _gameLoop;

  double cameraX = 0;
  double cameraY = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..repeat(reverse: true);
    super.initState();
    generateMaze();
     _gameLoop = Timer.periodic(Duration(milliseconds: 100), (_) => gameLoop());
       updateCamera();
  }

    @override
  void dispose() {
    _animationController.dispose();
    _gameLoop.cancel();
    super.dispose();
  }

  void generateMaze() {
    // Initialize maze with walls
    for (int y = 0; y < GRID_HEIGHT; y++) {
      for (int x = 0; x < GRID_WIDTH; x++) {
        maze[y][x] = 1;
      }
    }

    // Recursive backtracking to generate maze
    _carve(1, 1);

    // Add rivers and bridges
    // addRiversAndBridges();

    // Add some open areas with trees
    addOpenAreas();

    // Place player and exit
    playerX = 1;
    playerY = 1;
    maze[playerY][playerX] = 2;
    maze[GRID_HEIGHT - 2][GRID_WIDTH - 2] = 3;

    // Add some coins
    addCoins(15);

    // Add enemies
    addEnemies(currentLevel);
  }

 void gameLoop() {
    setState(() {
      moveEnemies();
      updateCamera();
    });
  }

  void updateCamera() {
    cameraX = (playerX - VISIBLE_TILES_X / 2).clamp(0, GRID_WIDTH - VISIBLE_TILES_X).toDouble();
    cameraY = (playerY - VISIBLE_TILES_Y / 2).clamp(0, GRID_HEIGHT - VISIBLE_TILES_Y).toDouble();
  }

  void _carve(int x, int y) {
    final directions = [(0, -2), (2, 0), (0, 2), (-2, 0)]..shuffle();

    for (final (dx, dy) in directions) {
      final nx = x + dx;
      final ny = y + dy;

      if (nx > 0 && nx < GRID_WIDTH - 1 && ny > 0 && ny < GRID_HEIGHT - 1 && maze[ny][nx] == 1) {
        maze[y + dy ~/ 2][x + dx ~/ 2] = 0;
        maze[ny][nx] = 0;
        _carve(nx, ny);
      }
    }
  }

  void addRiversAndBridges() {
    for (int i = 0; i < 2; i++) {
      int x = Random().nextInt(GRID_WIDTH - 10) + 5;
      for (int y = 0; y < GRID_HEIGHT; y++) {
        if (maze[y][x] == 0 && Random().nextDouble() < 0.2) {
          maze[y][x] = 8; // Bridge
        } else {
          maze[y][x] = 9; // River
        }
      }
    }
  }

  void addOpenAreas() {
    for (int i = 0; i < 3; i++) {
      int centerX = Random().nextInt(GRID_WIDTH - 10) + 5;
      int centerY = Random().nextInt(GRID_HEIGHT - 10) + 5;
      for (int dy = -2; dy <= 2; dy++) {
        for (int dx = -2; dx <= 2; dx++) {
          int x = centerX + dx;
          int y = centerY + dy;
          if (x > 0 && x < GRID_WIDTH - 1 && y > 0 && y < GRID_HEIGHT - 1) {
            if (Random().nextDouble() < 0.7) {
              maze[y][x] = 0; // Path
            } else {
              maze[y][x] = 7; // Tree
            }
          }
        }
      }
    }
  }

 void addCoins(int count) {
    final random = Random();
    int placed = 0;
    while (placed < count) {
      int x = random.nextInt(GRID_WIDTH - 2) + 1;
      int y = random.nextInt(GRID_HEIGHT - 2) + 1;
      if (maze[y][x] == 0) {
        maze[y][x] = 4; // 4 represents a crop
        placed++;
      }
    }
    totalCoins = count;
  }


  void addEnemies(int count) {
    final random = Random();
    enemies.clear();
    for (int i = 0; i < count; i++) {
      int x, y;
      do {
        x = random.nextInt(GRID_WIDTH - 2) + 1;
        y = random.nextInt(GRID_HEIGHT - 2) + 1;
      } while (maze[y][x] != 0);
      enemies.add(Enemy(x, y));
      maze[y][x] = 5; // 5 represents an animal
    }
  }
  void movePlayer(Direction direction) {
    setState(() {
      isPlayerMoving = true;
      playerDirection = direction;
      int dx = 0, dy = 0;
      switch (direction) {
        case Direction.up:
          dy = -1;
          break;
        case Direction.down:
          dy = 1;
          break;
        case Direction.left:
          dx = -1;
          break;
        case Direction.right:
          dx = 1;
          break;
      }

      int newX = playerX + dx;
      int newY = playerY + dy;

      if (newX >= 0 && newX < GRID_WIDTH && newY >= 0 && newY < GRID_HEIGHT) {
        if (maze[newY][newX] != 1) { // Not a wall
          if (maze[newY][newX] == 4) { // Crop
            score++;
            maze[newY][newX] = 0;
            if (score == totalCoins) {
              revealExit();
            }
          } else if (maze[newY][newX] == 5) { // Enemy
            gameOver();
            return;
          } else if (newX == exitX && newY == exitY && score == totalCoins) {
            levelCompleted();
            return;
          }
          maze[playerY][playerX] = maze[playerY][playerX] == 9 ? 9 : 0; // Keep river if player was on it
          playerX = newX;
          playerY = newY;
          maze[playerY][playerX] = 2;
        }
      }
    });

    // Reset moving state after a short delay
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        isPlayerMoving = false;
      });
    });
  }

    void revealExit() {
    maze[exitY][exitX] = 3; // 3 represents the exit
  }

  void moveEnemies() {
    for (var enemy in enemies) {
      Direction direction = Direction.values[Random().nextInt(4)];
      int dx = 0, dy = 0;
      switch (direction) {
        case Direction.up:
          dy = -1;
          break;
        case Direction.down:
          dy = 1;
          break;
        case Direction.left:
          dx = -1;
          break;
        case Direction.right:
          dx = 1;
          break;
      }

      int newX = enemy.x + dx;
      int newY = enemy.y + dy;

      if (newX >= 0 && newX < GRID_WIDTH && newY >= 0 && newY < GRID_HEIGHT && 
          (maze[newY][newX] == 0 || maze[newY][newX] == 9)) { // Allow movement on paths and rivers
        maze[enemy.y][enemy.x] = maze[enemy.y][enemy.x] == 9 ? 9 : 0; // Keep river if enemy was on it
        enemy.x = newX;
        enemy.y = newY;
        enemy.direction = direction;
        maze[enemy.y][enemy.x] = 5;

        if (enemy.x == playerX && enemy.y == playerY) {
          gameOver();
          return;
        }
      }
    }
  }

  void levelCompleted() {
    currentLevel++;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Level $currentLevel Completed!'),
          content: Text('Score: $score'),
          actions: <Widget>[
            TextButton(
              child: Text('Next Level'),
              onPressed: () {
                Navigator.of(context).pop();
                generateMaze();
              },
            ),
          ],
        );
      },
    );
  }

  void gameOver() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('Final Score: $score\nLevels Completed: ${currentLevel - 1}'),
          actions: <Widget>[
            TextButton(
              child: Text('Restart'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  score = 0;
                  currentLevel = 1;
                  generateMaze();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[100],
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Level: $currentLevel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Crops: $score / $totalCoins', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy > 0) {
                      movePlayer(Direction.down);
                    } else {
                      movePlayer(Direction.up);
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx > 0) {
                      movePlayer(Direction.right);
                    } else {
                      movePlayer(Direction.left);
                    }
                  },
                  child: Center(
                    child: Container(
                      width: VISIBLE_TILES_X * PIXEL_SIZE.toDouble(),
                      height: VISIBLE_TILES_Y * PIXEL_SIZE.toDouble(),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown[700]!, width: 4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return CustomPaint(
                              painter: VillageMazePainter(
                                maze,
                                _animationController,
                                isPlayerMoving,
                                playerDirection,
                                enemies,
                                cameraX,
                                cameraY,
                                VISIBLE_TILES_X,
                                VISIBLE_TILES_Y,
                              ),
                              size: Size(VISIBLE_TILES_X * PIXEL_SIZE.toDouble(), VISIBLE_TILES_Y * PIXEL_SIZE.toDouble()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VillageMazePainter extends CustomPainter {
  final List<List<int>> maze;
  final AnimationController animationController;
  final bool isPlayerMoving;
  final Direction playerDirection;
  final List<Enemy> enemies;
  final double cameraX;
  final double cameraY;
  final int visibleTilesX;
  final int visibleTilesY;

  VillageMazePainter(
    this.maze,
    this.animationController,
    this.isPlayerMoving,
    this.playerDirection,
    this.enemies,
    this.cameraX,
    this.cameraY,
    this.visibleTilesX,
    this.visibleTilesY,
  ) : super(repaint: animationController);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (int y = cameraY.toInt(); y < cameraY.toInt() + visibleTilesY; y++) {
      for (int x = cameraX.toInt(); x < cameraX.toInt() + visibleTilesX; x++) {
        if (y >= 0 && y < maze.length && x >= 0 && x < maze[y].length) {
          final drawX = (x - cameraX) * _GameScreenState.PIXEL_SIZE;
          final drawY = (y - cameraY) * _GameScreenState.PIXEL_SIZE;

          switch (maze[y][x]) {
            case 0: // Path
              paint.color = Colors.brown[200]!;
              break;
            case 1: // Grass
              paint.color = Colors.green[300]!;
              break;
            case 2: // Player (Black Cat)
              _drawBlackCat(canvas, drawX, drawY);
              continue;
            case 3: // Exit
              paint.color = Colors.red[400]!;
              break;
            case 4: // Crop
              paint.color = Colors.yellow[600]!;
              break;
            case 5: // Enemy (Dog)
              _drawDog(canvas, drawX, drawY, enemies.firstWhere((e) => e.x == x && e.y == y).direction);
              continue;
            case 7: // Tree
              _drawTree(canvas, drawX, drawY);
              continue;
            case 8: // Bridge
              paint.color = Colors.brown[600]!;
              break;
            case 9: // River
              paint.color = Colors.blue[400]!;
              break;
          }
          canvas.drawRect(
            Rect.fromLTWH(drawX, drawY, _GameScreenState.PIXEL_SIZE.toDouble(), _GameScreenState.PIXEL_SIZE.toDouble()),
            paint,
          );
        }
      }
    }
  }

  void _drawBlackCat(Canvas canvas, double x, double y) {
    final paint = Paint()..color = Colors.black;
    final catSize = _GameScreenState.PIXEL_SIZE.toDouble();
    final centerX = x + catSize / 2;
    final centerY = y + catSize / 2;

    // Body
    canvas.drawOval(
      Rect.fromCenter(center: Offset(centerX, centerY), width: catSize * 0.8, height: catSize * 0.6),
      paint,
    );

    // Head
    canvas.drawCircle(Offset(centerX, centerY - catSize * 0.2), catSize * 0.3, paint);

    // Ears
    final leftEar = Path()
      ..moveTo(centerX - catSize * 0.2, centerY - catSize * 0.4)
      ..lineTo(centerX - catSize * 0.1, centerY - catSize * 0.6)
      ..lineTo(centerX, centerY - catSize * 0.4)
      ..close();
    canvas.drawPath(leftEar, paint);

    final rightEar = Path()
      ..moveTo(centerX + catSize * 0.2, centerY - catSize * 0.4)
      ..lineTo(centerX + catSize * 0.1, centerY - catSize * 0.6)
      ..lineTo(centerX, centerY - catSize * 0.4)
      ..close();
    canvas.drawPath(rightEar, paint);

    // Eyes
    paint.color = Colors.yellow;
    canvas.drawCircle(Offset(centerX - catSize * 0.1, centerY - catSize * 0.25), catSize * 0.08, paint);
    canvas.drawCircle(Offset(centerX + catSize * 0.1, centerY - catSize * 0.25), catSize * 0.08, paint);

    // Animated tail
    if (isPlayerMoving) {
      final tailAngle = sin(animationController.value * pi * 2) * 0.2;
      final tailPath = Path()
        ..moveTo(centerX, centerY + catSize * 0.3)
        ..quadraticBezierTo(
          centerX + cos(tailAngle) * catSize * 0.4,
          centerY + catSize * 0.3 + sin(tailAngle) * catSize * 0.4,
          centerX + cos(tailAngle) * catSize * 0.8,
          centerY + catSize * 0.3 + sin(tailAngle) * catSize * 0.8,
        );
      canvas.drawPath(tailPath, Paint()..color = Colors.black..style = PaintingStyle.stroke..strokeWidth = 2);
    }
  }

  void _drawDog(Canvas canvas, double x, double y, Direction direction) {
    final paint = Paint()..color = Colors.brown[400]!;
    final dogSize = _GameScreenState.PIXEL_SIZE.toDouble();
    final centerX = x + dogSize / 2;
    final centerY = y + dogSize / 2;

    // Body
    canvas.drawOval(
      Rect.fromCenter(center: Offset(centerX, centerY), width: dogSize * 0.8, height: dogSize * 0.6),
      paint,
    );

    // Head
    canvas.drawCircle(Offset(centerX, centerY - dogSize * 0.2), dogSize * 0.25, paint);

    // Ears
    final leftEar = Path()
      ..moveTo(centerX - dogSize * 0.2, centerY - dogSize * 0.3)
      ..lineTo(centerX - dogSize * 0.3, centerY - dogSize * 0.5)
      ..lineTo(centerX - dogSize * 0.1, centerY - dogSize * 0.4)
      ..close();
    canvas.drawPath(leftEar, paint);

    final rightEar = Path()
      ..moveTo(centerX + dogSize * 0.2, centerY - dogSize * 0.3)
      ..lineTo(centerX + dogSize * 0.3, centerY - dogSize * 0.5)
      ..lineTo(centerX + dogSize * 0.1, centerY - dogSize * 0.4)
      ..close();
    canvas.drawPath(rightEar, paint);

    // Eyes
    paint.color = Colors.black;
    canvas.drawCircle(Offset(centerX - dogSize * 0.1, centerY - dogSize * 0.25), dogSize * 0.05, paint);
    canvas.drawCircle(Offset(centerX + dogSize * 0.1, centerY - dogSize * 0.25), dogSize * 0.05, paint);

    // Animated legs
    paint.color = Colors.brown[400]!;
    final legAngle = sin(animationController.value * pi * 2) * 0.2;
    for (int i = -1; i <= 1; i += 2) {
      canvas.drawLine(
        Offset(centerX + i * dogSize * 0.2, centerY + dogSize * 0.2),
        Offset(centerX + i * dogSize * 0.2 + cos(legAngle) * dogSize * 0.2, centerY + dogSize * 0.4),
        paint..strokeWidth = 2,
      );
    }
  }

  void _drawTree(Canvas canvas, double x, double y) {
    final paint = Paint();
    final treeSize = _GameScreenState.PIXEL_SIZE.toDouble();
    final centerX = x + treeSize / 2;
    final centerY = y + treeSize / 2;

    // Tree trunk
    paint.color = Colors.brown[600]!;
    canvas.drawRect(
      Rect.fromLTWH(centerX - treeSize * 0.1, centerY, treeSize * 0.2, treeSize * 0.4),
      paint,
    );

    // Tree leaves
    paint.color = Colors.green[800]!;
    final leavesPath = Path()
      ..moveTo(centerX, centerY - treeSize * 0.6)
      ..lineTo(centerX - treeSize * 0.4, centerY + treeSize * 0.2)
      ..lineTo(centerX + treeSize * 0.4, centerY + treeSize * 0.2)
      ..close();
    canvas.drawPath(leavesPath, paint);

    // Add some depth to the leaves
    paint.color = Colors.green[900]!;
    canvas.drawCircle(Offset(centerX, centerY - treeSize * 0.2), treeSize * 0.25, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

enum Direction { up, down, left, right }


class Enemy {
  int x;
  int y;
  Direction direction;

  Enemy(this.x, this.y) : direction = Direction.values[Random().nextInt(4)];
}
