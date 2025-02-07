import 'package:flutter/material.dart';
import 'package:guia_de_moteis/app/design_system/palette.dart';

class DottedMenuButton extends StatelessWidget {
  const DottedMenuButton({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(),
      child: Container(
        child: Row(
          children: [
            child,
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Palette.secondary
      ..strokeWidth = 0.4
      ..style = PaintingStyle.stroke;

    final double dashWidth = 2.5; // Width of each dash
    final double dashSpace = 2; // Space between each dash

    double startX = 0;

    // Draw bottom border
    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
