import 'package:flutter/cupertino.dart';
import 'package:progress_circle/src/progress_circle_painter.dart';

/// A progress circle box that sets restrictions to its painter and draws it.
class ProgressCircle extends StatelessWidget {
  /// A size of the widget.
  final double boxSize;

  /// Total value.
  final int total;

  /// Completed value.
  final int completed;

  /// A color of the progress curve.
  final Color curveColor;

  /// A Circle's arc width.
  final int arcWidth;

  /// Should the head of the curve line be rounded.
  final bool isRoundedHead;

  /// The head's icon.
  final IconData? headIcon;

  /// The head icon size.
  final double headIconSize;

  /// Should the tail of the curve line be rounded.
  final bool isRoundedTail;

  /// The head's icon.
  final IconData? tailIcon;

  /// The head icon size.
  final double tailIconSize;

  /// An optional message in the center.
  final String? centerMessage;

  /// A text style for the center message.
  final TextStyle? centerMessageStyle;

  /// A color behind the circle.
  final Color backgroundColor;

  /// A color of the circle's arc.
  final Color arcColor;

  const ProgressCircle({
    super.key,
    required this.boxSize,
    required this.total,
    required this.completed,
    this.curveColor = CupertinoColors.activeBlue,
    this.arcWidth = 35,
    this.isRoundedHead = false,
    this.headIcon,
    this.headIconSize = 15.0,
    this.isRoundedTail = false,
    this.tailIcon,
    this.tailIconSize = 15.0,
    this.centerMessage,
    this.centerMessageStyle,
    this.backgroundColor = CupertinoColors.white,
    this.arcColor = CupertinoColors.systemGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size.square(boxSize),
        painter: ProgressCirclePainter(
          total: total,
          completed: completed,
          curveColor: curveColor,
          arcWidth: arcWidth,
          isRoundedHead: isRoundedHead,
          headIcon: headIcon,
          headIconSize: headIconSize,
          isRoundedTail: isRoundedTail,
          tailIcon: tailIcon,
          tailIconSize: tailIconSize,
          centerMessage: centerMessage,
          centerMessageStyle: centerMessageStyle,
          backgroundColor: backgroundColor,
          arcColor: arcColor,
        ),
      ),
    );
  }
}