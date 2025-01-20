import 'package:flutter/material.dart';
import 'package:progress_circle/src/progress_circle_painter.dart';
import 'package:progress_circle/src/progress_circle_style.dart';

/// A progress circle box that sets restrictions to its painter and draws it.
class ProgressCircle extends StatelessWidget {
  /// Creates a default ProgressCircle.
  const ProgressCircle({
    super.key,
    this.total = 1,
    this.completed = 0,
    this.completedPercent,
    this.size = const Size.fromRadius(100),
    this.style = const ProgressCircleStyle(),
  });

  /// ProgressCircle based on `total` and `completed` values.
  const ProgressCircle.fromValues({
    super.key,
    required this.total,
    required this.completed,
    this.size = const Size.fromRadius(100),
    this.style = const ProgressCircleStyle(),
  }) : completedPercent = null;

  /// ProgressCircle based on `completedPercent` value.
  const ProgressCircle.fromPercent({
    super.key,
    required this.completedPercent,
    this.size = const Size.fromRadius(100),
    this.style = const ProgressCircleStyle(),
  })  : total = 0,
        completed = 0;

  /// Total value.
  final double total;

  /// Completed value.
  final double completed;

  /// Complete percent e.g. 34.7%.
  ///
  /// Accepts any positive number
  /// such as 0.84, 13.4, 50.0, 100.0, 113.6 etc
  /// to layout the progress.
  final double? completedPercent;

  /// Size of the widget.
  final Size size;

  /// Style properties for the widget.
  final ProgressCircleStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: size,
        painter: ProgressCirclePainter(
          total: total,
          completed: completed,
          completedPercent: completedPercent,
          style: style,
        ),
      ),
    );
  }
}
