import 'package:flutter/material.dart';
import 'package:progress_circle/progress_circle.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const _boxSize = 200.0;
  static const _indent = 10.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(_indent),
            child: ListView(
              children: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('0/8'),
                    Text('1/8'),
                    Text('2/8'),
                    Text('3/8'),
                    Text('4/8'),
                    Text('5/8'),
                    Text('6/8'),
                    Text('7/8'),
                    Text('8/8'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'default arguments:',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                Text(
                  'isRoundedHead: true',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 0,
                      total: 8,
                      isRoundedHead: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 1,
                      total: 8,
                      isRoundedHead: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 2,
                      total: 8,
                      isRoundedHead: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 3,
                      total: 8,
                      isRoundedHead: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 4,
                      total: 8,
                      isRoundedHead: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 5,
                      total: 8,
                      isRoundedHead: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 6,
                      total: 8,
                      isRoundedHead: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 7,
                      total: 8,
                      isRoundedHead: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 8,
                      total: 8,
                      isRoundedHead: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'isRoundedTail: true',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 0,
                      total: 8,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 1,
                      total: 8,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 2,
                      total: 8,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 3,
                      total: 8,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 4,
                      total: 8,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 5,
                      total: 8,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 6,
                      total: 8,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 7,
                      total: 8,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 8,
                      total: 8,
                      isRoundedTail: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'isRoundedHead, isRoundedTail: true',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 0,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 1,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 2,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 3,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 4,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 5,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 6,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 7,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                    ProgressCircle(
                      boxSize: _boxSize,
                      completed: 8,
                      total: 8,
                      isRoundedHead: true,
                      isRoundedTail: true,
                    ),
                  ],
                ),
                //////////////////
                //////////////////
                //////////////////
                //////////////////
                //////////////////
                SizedBox(height: 200),
                // SizedBox(height: 20),
                // Text(
                //   'progressArcColor:',
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 0,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 1,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 2,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 3,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 4,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 5,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 6,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 7,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 8,
                //       total: 8,
                //       progressArcColor: Colors.orange,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 20),
                // Text(
                //   'arcColor:',
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 0,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 1,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 2,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 3,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 4,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 5,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 6,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 7,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 8,
                //       total: 8,
                //       arcColor: Colors.black12,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 20),
                // Text(
                //   'isRoundedHead: true',
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 0,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 1,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 2,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 3,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 4,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 5,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 6,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 7,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //     ProgressCircle(
                //       boxSize: _boxSize,
                //       completed: 8,
                //       total: 8,
                //       isRoundedTail: true,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
