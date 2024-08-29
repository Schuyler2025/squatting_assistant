import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
     ..color = Color.fromARGB(255, 231, 111, 81)
     ..strokeWidth = 5
     ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleWidget extends StatelessWidget {
  final Widget child;
  const CircleWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(),
      child: Container(
        width: 80,
        height: 80,
        child:Center(child: child)
      ),
    );
  }
}
