import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:progress_circle/src/progress_circle_style.dart';

/// A Painter for drawing a circle with its progress curve.
class ProgressCirclePainter extends CustomPainter {
  /// Paints ProgressCircle based on the given properties.
  const ProgressCirclePainter({
    required this.total,
    required this.completed,
    required this.completedPercent,
    required this.style,
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

  /// Total value.
  final double total;

  /// Completed value.
  final double completed;

  /// Complete percent e.g. 34.7%.
  final double? completedPercent;

  /// Style properties for the widget.
  final ProgressCircleStyle style;

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

    final innerCirclePaint = Paint()..color = style.innerColor;
    final outerCirclePaint = Paint()..color = style.arcColor;

    final outerCircleRadius = size.width / 2;
    final innerCircleRadius = outerCircleRadius - style.arcWidth;

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
      centerMessage: style.centerMessage,
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
    final curvePaint = Paint()..color = style.progressArcColor;

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
    if (!style.isRoundedHead) return;

    if (_completedPercent <= 0) return;
    final headRadius = style.arcWidth / 2;
    final headPaint = Paint()..color = style.progressArcColor;

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
    if (style.headIcon == null) return;
    if (_completedPercent >= 100) return;

    canvas.translate(headPoint.dx, headPoint.dy);
    _rotateProgressCounterclockwise(canvas: canvas);

    final iconOffset = -style.headIconSize / 2;
    final pictureRecorder = PictureRecorder();
    final iconCanvas = Canvas(pictureRecorder);

    final iconPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    iconPainter.text = TextSpan(
      text: String.fromCharCode(style.headIcon!.codePoint),
      style: TextStyle(
        fontFamily: style.headIcon!.fontFamily,
        package: style.headIcon!.fontPackage,
        fontSize: style.headIconSize,
        color: style.headIconColor,
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
    if (!style.isRoundedTail) return;

    if (_completedPercent <= 0) return;
    final headRadius = style.arcWidth / 2;
    final headPaint = Paint()..color = style.progressArcColor;

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
    if (style.tailIcon == null) return;
    if (_completedPercent <= 0) return;

    final iconOffset = -style.headIconSize / 2;
    final pictureRecorder = PictureRecorder();
    final iconCanvas = Canvas(pictureRecorder);

    final iconPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    iconPainter.text = TextSpan(
      text: String.fromCharCode(style.tailIcon!.codePoint),
      style: TextStyle(
        fontFamily: style.tailIcon!.fontFamily,
        package: style.tailIcon!.fontPackage,
        fontSize: style.tailIconSize,
        color: style.tailIconColor,
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
      style: style.centerMessageStyle ??
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
