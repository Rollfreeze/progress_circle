import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// A Painter for drawing a circle with its progress curve.
class ProgressCirclePainter extends CustomPainter {
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

  /// The head's icon size.
  final double headIconSize;

  /// The head's icon color.
  final Color headIconColor;

  /// Should the tail of the curve line be rounded.
  final bool isRoundedTail;

  /// The tail's icon.
  final IconData? tailIcon;

  /// The tail icon size.
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

  const ProgressCirclePainter({
    required this.total,
    required this.completed,
    required this.completedPercent,
    required this.progressArcColor,
    required this.arcWidth,
    required this.isRoundedHead,
    required this.headIcon,
    required this.headIconSize,
    required this.headIconColor,
    required this.isRoundedTail,
    required this.tailIcon,
    required this.tailIconSize,
    required this.tailIconColor,
    required this.centerMessage,
    required this.centerMessageStyle,
    required this.innerColor,
    required this.arcColor,
  })  : assert(
          total >= completed,
          "Total can't be less than completed",
        ),
        assert(
          completed >= 0.0,
          "Completed can't be less than 0",
        ),
        assert(
          total >= 0.0,
          "Total can't be less than 0",
        ),
        assert(
          completedPercent == null || completedPercent >= 0.0,
          "Completed percent can't be less than 0",
        );

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double get _completedPercent => completedPercent ?? completed * 100 / total;

  double get _progressSweepAngle {
    const oneDegree = pi / 180;
    final progressCurvePercent = 360 * _completedPercent / 100;
    final sweepAngle = oneDegree * progressCurvePercent;
    return sweepAngle;
  }

  @override
  void paint(Canvas canvas, Size size) {
    assert(size.height == size.width, "A parent box must be square");

    final innerCirclePaint = Paint()..color = innerColor;
    final outerCirclePaint = Paint()..color = arcColor;

    final outerCircleRadius = size.width / 2;
    final innerCircleRadius = outerCircleRadius - arcWidth;

    final center = Offset(outerCircleRadius, outerCircleRadius);

    /// Outer circle.
    canvas.drawCircle(
      center,
      outerCircleRadius,
      outerCirclePaint,
    );

    _drawProgressCurve(
      canvas: canvas,
      size: size,
      center: center,
    );

    /// Inner circle.
    canvas.drawCircle(
      center,
      innerCircleRadius,
      innerCirclePaint,
    );

    _maybeDrawText(
      canvas: canvas,
      size: size,
      dx: center.dx,
      dy: center.dy,
      centerMessage: centerMessage,
      innerRadius: innerCircleRadius * 2,
    );

    _maybeDrawProgressTail(
      canvas: canvas,
      size: size,
      center: center,
    );

    _maybeDrawProgressHead(
      canvas: canvas,
      size: size,
      center: center,
    );
  }

  /// Progress curve.
  void _drawProgressCurve({
    required Canvas canvas,
    required Size size,
    required Offset center,
  }) {
    const startAngle = 3 * pi / 2;
    final curvePaint = Paint()..color = progressArcColor;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: size.width / 2,
      ),
      startAngle,
      _progressSweepAngle,
      true,
      curvePaint,
    );
  }

  void _rotateProgressClockwise({
    required Canvas canvas,
  }) {
    canvas.rotate(-pi / 2);
    canvas.rotate(_progressSweepAngle);
  }

  void _rotateProgressCounterclockwise({
    required Canvas canvas,
  }) {
    canvas.rotate(-_progressSweepAngle);
    canvas.rotate(pi / 2);
  }

  /// Draws a progress curve rounded head.
  void _maybeDrawProgressHead({
    required Canvas canvas,
    required Size size,
    required Offset center,
  }) {
    if (!isRoundedHead) return;

    if (_completedPercent <= 0) return;
    final headRadius = arcWidth / 2;
    final headPaint = Paint()..color = progressArcColor;

    final headPoint = Offset(size.width / 2 - headRadius, 0);

    canvas.translate(center.dx, center.dy);
    _rotateProgressClockwise(canvas: canvas);

    canvas.drawCircle(
      headPoint,
      headRadius,
      headPaint,
    );

    _maybeDrawProgressHeadIcon(
      headPoint: headPoint,
      canvas: canvas,
    );
  }

  void _maybeDrawProgressHeadIcon({
    required Offset headPoint,
    required Canvas canvas,
  }) {
    if (headIcon == null) return;
    if (_completedPercent >= 100) return;

    canvas.translate(headPoint.dx, headPoint.dy);
    _rotateProgressCounterclockwise(canvas: canvas);

    final iconOffset = -headIconSize / 2;
    final pictureRecorder = PictureRecorder();
    final iconCanvas = Canvas(pictureRecorder);

    final iconPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    iconPainter.text = TextSpan(
      text: String.fromCharCode(headIcon!.codePoint),
      style: TextStyle(
        fontFamily: headIcon!.fontFamily,
        package: headIcon!.fontPackage,
        fontSize: headIconSize,
        color: headIconColor,
      ),
    );

    iconPainter.layout();
    iconPainter.paint(
      iconCanvas,
      Offset(iconOffset, iconOffset),
    );

    final picture = pictureRecorder.endRecording();
    canvas.drawPicture(picture);
  }

  /// Draws a progress curve rounded head.
  void _maybeDrawProgressTail({
    required Canvas canvas,
    required Size size,
    required Offset center,
  }) {
    if (!isRoundedTail) return;

    if (_completedPercent <= 0) return;
    final headRadius = arcWidth / 2;
    final headPaint = Paint()..color = progressArcColor;

    final headPoint = Offset(size.width / 2, headRadius);

    canvas.drawCircle(
      headPoint,
      headRadius,
      headPaint,
    );

    _maybeDrawProgressTailIcon(
      headPoint: headPoint,
      canvas: canvas,
    );
  }

  void _maybeDrawProgressTailIcon({
    required Offset headPoint,
    required Canvas canvas,
  }) {
    if (tailIcon == null) return;
    if (_completedPercent <= 0) return;

    final iconOffset = -headIconSize / 2;
    final pictureRecorder = PictureRecorder();
    final iconCanvas = Canvas(pictureRecorder);

    final iconPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    iconPainter.text = TextSpan(
      text: String.fromCharCode(tailIcon!.codePoint),
      style: TextStyle(
        fontFamily: tailIcon!.fontFamily,
        package: tailIcon!.fontPackage,
        fontSize: tailIconSize,
        color: tailIconColor,
      ),
    );

    iconPainter.layout();
    iconPainter.paint(
      iconCanvas,
      Offset(headPoint.dx + iconOffset, headPoint.dy + iconOffset),
    );

    final picture = pictureRecorder.endRecording();
    canvas.drawPicture(picture);
  }

  /// Draws a centred message.
  void _maybeDrawText({
    required Canvas canvas,
    required Size size,
    required double dx,
    required double dy,
    required String? centerMessage,
    required double innerRadius,
  }) {
    if (centerMessage == null) return;

    final textSpan = TextSpan(
      text: centerMessage,
      style: centerMessageStyle ??
          const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: innerRadius);

    final textPoint = Offset(
      dx - textPainter.size.width / 2,
      dy - textPainter.size.height / 2,
    );

    textPainter.paint(canvas, textPoint);
  }
}
