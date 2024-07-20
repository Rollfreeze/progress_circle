import 'package:flutter/material.dart';
import 'package:progress_circle/progress_circle.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const _boxSize = 200.0;
  static const _indent = 50.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: ListView(
              children: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 0,
                      total: 8,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 1,
                      total: 8,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 2,
                      total: 8,
                    ),
                  ],
                ),
                SizedBox(height: _indent),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 3,
                      total: 8,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 4,
                      total: 8,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 5,
                      total: 8,
                    ),
                  ],
                ),
                SizedBox(height: _indent),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 6,
                      total: 8,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 7,
                      total: 8,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 8,
                      total: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
