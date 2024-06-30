import 'package:flutter/material.dart';
import 'dart:math' as math;
class PendulumPainter extends CustomPainter {
  final double angle;
  final double length;
  final double mass;
  final List<Offset> trail;
  final bool showTrail;

  PendulumPainter(this.angle, this.length, this.mass, this.trail, this.showTrail);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, 20);
    final endPoint = center + Offset(math.sin(angle) * length * 300, math.cos(angle) * length * 300);

    if (showTrail) {
      final trailPaint = Paint()
        ..color = Colors.red.withOpacity(0.5)
        ..strokeWidth = 1;
      for (int i = 0; i < trail.length - 1; i++) {
        canvas.drawLine(trail[i], trail[i + 1], trailPaint);
      }
    }

    canvas.drawLine(center, endPoint, paint);
    canvas.drawCircle(endPoint, 10 + mass * 10, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(PendulumPainter oldDelegate) =>
      angle != oldDelegate.angle ||
      length != oldDelegate.length ||
      mass != oldDelegate.mass ||
      trail != oldDelegate.trail ||
      showTrail != oldDelegate.showTrail;
}
