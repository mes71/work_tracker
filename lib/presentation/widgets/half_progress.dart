import 'dart:math' as math;

import 'package:flutter/material.dart';

class HalfCircleProgressBar extends StatelessWidget {
  final double progress;
  final double thickness;
  final Color backgroundColor;
  final Color progressColor;

  const HalfCircleProgressBar({
    super.key,
    required this.progress,
    this.thickness = 10.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  }) : assert(progress >= 0.0 && progress <= 1.0);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HalfCircleProgressPainter(
        progress: progress,
        thickness: thickness,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
      ),
    );
  }
}

class _HalfCircleProgressPainter extends CustomPainter {
  final double progress;
  final double thickness;
  final Color backgroundColor;
  final Color progressColor;

  _HalfCircleProgressPainter({
    required this.progress,
    required this.thickness,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Background Arc
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
        rect, math.pi, math.pi, false, backgroundPaint); // Half circle

    // Progress Arc
    final progressAngle = math.pi * progress;
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round // For rounded ends
      ..style = PaintingStyle.stroke;
    canvas.drawArc(rect, math.pi, progressAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
