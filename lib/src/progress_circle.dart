import 'package:flutter/material.dart';
import 'package:progress_circle/src/progress_circle_painter.dart';
import 'package:progress_circle/src/progress_circle_style.dart';

/// A progress circle box that sets restrictions to its painter and draws it.
class ProgressCircle extends StatelessWidget {
  /// Creates a default ProgressCircle.
  const ProgressCircle({
    super.key,
    required this.boxSize,
    this.total = 0,
    this.completed = 0,
    this.completedPercent,
    this.style = const ProgressCircleStyle(),
  });

  /// ProgressCircle based on `total` and `completed` values.
  const ProgressCircle.fromValues({
    super.key,
    required this.boxSize,
    required this.total,
    required this.completed,
    this.style = const ProgressCircleStyle(),
  }) : completedPercent = null;

  /// ProgressCircle based on `completedPercent` value.
  const ProgressCircle.fromPercent({
    super.key,
    required this.boxSize,
    required this.completedPercent,
    this.style = const ProgressCircleStyle(),
  })  : total = 0,
        completed = 0;

  /// A size of the widget.
  final double boxSize;

  /// Total value.
  final double total;

  /// Completed value.
  final double completed;

  /// Complete percent e.g. 34.7%.
  final double? completedPercent;

  /// Style properties for the widget.
  final ProgressCircleStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size.square(boxSize),
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
