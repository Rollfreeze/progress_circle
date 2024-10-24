import 'package:flutter/material.dart';
import 'package:progress_circle/src/progress_circle_painter.dart';

/// A progress circle box that sets restrictions to its painter and draws it.
class ProgressCircle extends StatelessWidget {
  /// A size of the widget.
  final double boxSize;

  /// Total value.
  final double total;

  /// Completed value.
  final double completed;

  /// Complete percent e.g. 34.7%.
  final double? completedPercent;

  /// A color of the progress curve.
  final Color progressArcColor;

  /// A Circle's arc width.
  final double arcWidth;

  /// Should the head of the curve line be rounded.
  final bool isRoundedHead;

  /// The head's icon.
  final IconData? headIcon;

  /// The head icon size.
  final double headIconSize;

  /// The head's icon color.
  final Color headIconColor;

  /// Should the tail of the curve line be rounded.
  final bool isRoundedTail;

  /// The head's icon.
  final IconData? tailIcon;

  /// The head icon size.
  final double tailIconSize;

  /// The tails's icon color.
  final Color tailIconColor;

  /// An optional message in the center.
  final String? centerMessage;

  /// A text style for the center message.
  final TextStyle? centerMessageStyle;

  /// A color behind the circle.
  final Color innerColor;

  /// A color of the circle's arc.
  final Color arcColor;

  const ProgressCircle({
    super.key,
    required this.boxSize,
    this.total = 0,
    this.completed = 0,
    this.completedPercent,
    this.progressArcColor = Colors.blue,
    this.arcWidth = 35,
    this.isRoundedHead = true,
    this.headIcon,
    this.headIconSize = 15.0,
    this.headIconColor = Colors.white,
    this.isRoundedTail = true,
    this.tailIcon,
    this.tailIconSize = 15.0,
    this.tailIconColor = Colors.white,
    this.centerMessage,
    this.centerMessageStyle,
    this.innerColor = Colors.white,
    this.arcColor = const Color(0XFFEFEFF4),
  });

  /// ProgressCircle based on `total` and `completed` values.
  const ProgressCircle.fromValues({
    super.key,
    required this.boxSize,
    required this.total,
    required this.completed,
    this.progressArcColor = Colors.blue,
    this.arcWidth = 35,
    this.isRoundedHead = true,
    this.headIcon,
    this.headIconSize = 15.0,
    this.headIconColor = Colors.white,
    this.isRoundedTail = true,
    this.tailIcon,
    this.tailIconSize = 15.0,
    this.tailIconColor = Colors.white,
    this.centerMessage,
    this.centerMessageStyle,
    this.innerColor = Colors.white,
    this.arcColor = const Color(0XFFEFEFF4),
  }) : completedPercent = null;

  /// ProgressCircle based on `completedPercent` value.
  const ProgressCircle.fromPercent({
    super.key,
    required this.boxSize,
    required this.completedPercent,
    this.progressArcColor = Colors.blue,
    this.arcWidth = 35,
    this.isRoundedHead = true,
    this.headIcon,
    this.headIconSize = 15.0,
    this.headIconColor = Colors.white,
    this.isRoundedTail = true,
    this.tailIcon,
    this.tailIconSize = 15.0,
    this.tailIconColor = Colors.white,
    this.centerMessage,
    this.centerMessageStyle,
    this.innerColor = Colors.white,
    this.arcColor = const Color(0XFFEFEFF4),
  })  : total = 0,
        completed = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size.square(boxSize),
        painter: ProgressCirclePainter(
          total: total,
          completed: completed,
          completedPercent: completedPercent,
          progressArcColor: progressArcColor,
          arcWidth: arcWidth,
          isRoundedHead: isRoundedHead,
          headIcon: headIcon,
          headIconSize: headIconSize,
          headIconColor: headIconColor,
          isRoundedTail: isRoundedTail,
          tailIcon: tailIcon,
          tailIconSize: tailIconSize,
          tailIconColor: tailIconColor,
          centerMessage: centerMessage,
          centerMessageStyle: centerMessageStyle,
          innerColor: innerColor,
          arcColor: arcColor,
        ),
      ),
    );
  }
}
