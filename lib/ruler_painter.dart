import 'package:flutter/material.dart';

class RulerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    for (int i = 0; i <= 100; i++) {
      double y = i * size.height / 100;
      double lineLength = i % 10 == 0 ? 20 : (i % 5 == 0 ? 15 : 10);
      canvas.drawLine(Offset(size.width - lineLength, y), Offset(size.width, y), paint);

      if (i % 10 == 0) {
        TextPainter(
          text: TextSpan(text: '${100 - i}', style: const TextStyle(color: Colors.black, fontSize: 10)),
          textDirection: TextDirection.ltr,
        )
          ..layout()
          ..paint(canvas, Offset(0, y - 5));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
