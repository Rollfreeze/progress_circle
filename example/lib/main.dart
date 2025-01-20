import 'package:flutter/material.dart';
import 'package:progress_circle/progress_circle.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const _boxSize = 200.0;
  static const _indent = 20.0;
  static const _bgColor = Color.fromRGBO(253, 247, 254, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _bgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(_indent),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  const ProgressCircle(
                    boxSize: _boxSize,
                    completed: 2,
                    total: 4,
                    completedPercent: 16,
                    style: ProgressCircleStyle(
                      innerColor: _bgColor,
                    ),
                  ),
                  const ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 1,
                    total: 4,
                    style: ProgressCircleStyle(
                      innerColor: _bgColor,
                    ),
                  ),
                  ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 2,
                    total: 4,
                    style: ProgressCircleStyle(
                      headIcon: Icons.star,
                      tailIcon: Icons.apple,
                      progressArcColor: Colors.orange,
                      innerColor: Colors.orange.shade100,
                      centerMessage: '50 %',
                    ),
                  ),
                  const ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 5,
                    total: 6,
                    style: ProgressCircleStyle(
                      centerMessage: '5 / 6',
                      innerColor: _bgColor,
                      progressArcColor: Colors.pinkAccent,
                      headIcon: Icons.star,
                      tailIcon: Icons.apple,
                    ),
                  ),
                  ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 4,
                    total: 4,
                    style: ProgressCircleStyle(
                      innerColor: Colors.green.shade600,
                      progressArcColor: Colors.green.shade900,
                    ),
                  ),
                  ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 4,
                    total: 4,
                    style: ProgressCircleStyle(
                      headIcon: Icons.star,
                      tailIcon: Icons.apple,
                      innerColor: Colors.orange.shade100,
                      progressArcColor: Colors.orange.shade600,
                    ),
                  ),
                  ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 4,
                    total: 4,
                    style: ProgressCircleStyle(
                      innerColor: Colors.red.shade900,
                      progressArcColor: Colors.red,
                      headIcon: Icons.star,
                      tailIcon: Icons.apple,
                    ),
                  ),
                  const ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 6,
                    total: 8,
                    style: ProgressCircleStyle(
                      arcWidth: 15,
                    ),
                  ),
                  const ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 2,
                    total: 4,
                    style: ProgressCircleStyle(
                      arcWidth: 30,
                    ),
                  ),
                  const ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 3,
                    total: 8,
                    style: ProgressCircleStyle(
                      arcWidth: 60,
                    ),
                  ),
                  const ProgressCircle.fromPercent(
                    boxSize: _boxSize,
                    completedPercent: 0,
                  ),
                  const ProgressCircle.fromValues(
                    boxSize: _boxSize,
                    completed: 5,
                    total: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
