import 'package:flutter/material.dart';
void main() {
  runApp( MovingSquareApp());
}

class MovingSquareApp extends StatefulWidget {
  @override
  _MovingSquareAppState createState() => _MovingSquareAppState();
}

class _MovingSquareAppState extends State<MovingSquareApp> {
  double _position = 0.0;
  bool _isMoving = false;
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height:
                    150, 
                child: Stack(
                  children: [
                 
                    AnimatedPositioned(
                      left: _position,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isMoving || _position <= 0 ? null : _moveLeft,
                    child: Text('To Left'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _isMoving || _position >= screenWidth - 100
                        ? null
                        : _moveRight,
                    child: Text('To Right'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _moveLeft() {
    setState(() {
      _isMoving = true;
      _position = 0;
    });
    _completeMovement();
  }

  void _moveRight() {
    setState(() {
      _isMoving = true;
      _position = screenWidth - 100;
    });
    _completeMovement();
  }

  void _completeMovement() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isMoving = false;
      });
    });
  }
}
