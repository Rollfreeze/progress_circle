import 'package:flutter/material.dart';
import 'package:progress_circle/progress_circle.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const _bgColor = Color.fromRGBO(253, 247, 254, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _bgColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                spacing: 100.0,
                runSpacing: 50.0,
                children: [
                  const ProgressCircle(
                    completedPercent: 0,
                  ),

                  const ProgressCircle(
                    completedPercent: 0,
                    style: ProgressCircleStyle(
                      showZeroProgress: true,
                    ),
                  ),

                  const ProgressCircle(
                    completedPercent: 0,
                    style: ProgressCircleStyle(
                      showZeroProgress: true,
                      headIcon: Icons.apple,
                    ),
                  ),

                  const ProgressCircle(total: 100, completed: 35), // by values
                  const ProgressCircle(total: 100, completed: 70), // by values
                  const ProgressCircle(completedPercent: 85), // by percent

                  /// fromPercent
                  const ProgressCircle.fromPercent(
                    completedPercent: 35,
                    style: ProgressCircleStyle(
                      headIcon: Icons.apple,
                      arcWidth: 20,
                    ),
                  ),
                  const ProgressCircle.fromPercent(
                    completedPercent: 70,
                    style: ProgressCircleStyle(
                      tailIcon: Icons.star,
                      arcWidth: 30,
                    ),
                  ),
                  const ProgressCircle.fromPercent(
                    completedPercent: 85,
                    style: ProgressCircleStyle(
                      headIcon: Icons.apple,
                      tailIcon: Icons.star,
                      arcWidth: 50,
                    ),
                  ),

                  /// fromValues
                  const ProgressCircle.fromValues(
                    total: 100,
                    completed: 35,
                    style: ProgressCircleStyle(
                      progressArcColor: Colors.orange,
                      headIcon: Icons.apple,
                    ),
                  ),
                  const ProgressCircle.fromValues(
                    total: 100,
                    completed: 70,
                    style: ProgressCircleStyle(
                      progressArcColor: Colors.green,
                      tailIcon: Icons.star,
                    ),
                  ),

                  const ProgressCircle.fromValues(
                    total: 100,
                    completed: 85,
                    style: ProgressCircleStyle(
                      progressArcColor: Colors.purple,
                      headIcon: Icons.apple,
                      tailIcon: Icons.star,
                    ),
                  ),

                  /// Some more style
                  ProgressCircle.fromValues(
                    total: 100,
                    completed: 35,
                    style: ProgressCircleStyle(
                      progressArcColor: Colors.orange,
                      arcColor: Colors.orange.shade100,
                      headIcon: Icons.apple,
                    ),
                  ),
                  ProgressCircle.fromValues(
                    total: 100,
                    completed: 70,
                    style: ProgressCircleStyle(
                      progressArcColor: Colors.green,
                      arcColor: Colors.green.shade100,
                      tailIcon: Icons.star,
                    ),
                  ),

                  ProgressCircle.fromValues(
                    total: 100,
                    completed: 85,
                    style: ProgressCircleStyle(
                      progressArcColor: Colors.purple,
                      arcColor: Colors.purple.shade100,
                      headIcon: Icons.apple,
                      tailIcon: Icons.star,
                    ),
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
