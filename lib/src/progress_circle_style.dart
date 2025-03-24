import 'package:flutter/material.dart';

/// Style properties of the widget.
class ProgressCircleStyle {
  /// Creates a default style.
  const ProgressCircleStyle({
    this.progressArcColor = Colors.blue,
    this.arcWidth = 35,
    this.isRoundedHead = true,
    this.headIcon,
    this.headIconSize = 15.0,
    this.headIconColor = Colors.white,
    this.useHeadIconRotation = false,
    this.isRoundedTail = true,
    this.tailIcon,
    this.tailIconSize = 15.0,
    this.tailIconColor = Colors.white,
    this.centerMessage,
    this.centerMessageStyle,
    this.innerColor = Colors.white,
    this.arcColor = const Color(0XFFEFEFF4),
    this.showZeroProgress = false,
  });

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

  /// Whether the head icon follow with the progress angle.
  final bool useHeadIconRotation;

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

  /// Draws a head with zero progress when it's true.
  ///
  /// It has effect when the circle has a rounded style progress curve.
  final bool showZeroProgress;
}
