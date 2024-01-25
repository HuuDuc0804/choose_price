import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProcessCircularPage extends StatefulWidget {
  const ProcessCircularPage({super.key});

  @override
  State<ProcessCircularPage> createState() => _ProcessCircularPageState();
}

class _ProcessCircularPageState extends State<ProcessCircularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                alignment: Alignment.center,
                child: Animate().custom(
                  begin: 0,
                  end: 100,
                  duration: 2.seconds,
                  builder: (context, value, child) {
                    return Text(
                      '${value.round()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 90,
                      ),
                    );
                  },
                ),
              ),
              Animate().custom(
                begin: 0,
                end: 100,
                duration: 2.seconds,
                builder: (context, value, child) {
                  return CustomPaint(
                    size: const Size(200, 200),
                    painter: ProcessPaint(
                      percent: value.round(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessPaint extends CustomPainter {
  final int percent;

  ProcessPaint({super.repaint, required this.percent});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red.shade400
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Rect myRect = Offset.zero & size;
    canvas.drawArc(
      myRect,
      3 * pi / 2,
      2 * pi / 100 * percent,
      false,
      paint,
    );
    // canvas.drawCircle(Offset(1.0, 2.0), 200, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
