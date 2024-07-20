import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:progress_circle/progress_circle.dart';

void main() {
  const indent = 40.0;
  const boxSize = 300.0;
  testGoldens(
    'ProgressCircle',
    (tester) async {
      await loadAppFonts();

      final builder = GoldenBuilder.column(
        bgColor: Colors.white,
        wrap: (child) => Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: indent),
            child: child,
          ),
        ),
      )..addScenario(
          '',
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Default settings',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: indent),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressCircle(
                    boxSize: boxSize,
                    completed: 1,
                    total: 8,
                  ),
                  ProgressCircle(
                    boxSize: boxSize,
                    completed: 2,
                    total: 8,
                  ),
                  ProgressCircle(
                    boxSize: boxSize,
                    completed: 3,
                    total: 8,
                  ),
                  ProgressCircle(
                    boxSize: boxSize,
                    completed: 4,
                    total: 8,
                  ),
                ],
              ),
              SizedBox(height: indent),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressCircle(
                    boxSize: boxSize,
                    completed: 5,
                    total: 8,
                  ),
                  ProgressCircle(
                    boxSize: boxSize,
                    completed: 6,
                    total: 8,
                  ),
                  ProgressCircle(
                    boxSize: boxSize,
                    completed: 7,
                    total: 8,
                  ),
                  ProgressCircle(
                    boxSize: boxSize,
                    completed: 8,
                    total: 8,
                  ),
                ],
              ),
            ],
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(2000, 2000),
        wrapper: materialAppWrapper(),
      );

      await screenMatchesGolden(
        tester,
        'progress_circle',
      );
    },
  );
}
