import 'dart:math';

import 'package:flutter/material.dart';

class PercentageDial extends StatefulWidget {
  final ValueChanged<double>? onPercentageChanged;

  const PercentageDial({Key? key, this.onPercentageChanged}) : super(key: key);

  @override
  _PercentageDialState createState() => _PercentageDialState();
}

class _PercentageDialState extends State<PercentageDial> {
  double _percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      child: CustomPaint(
        size: Size(200, 200),
        painter: _DialPainter(_percentage),
        child: Center(
          child: Text(
            '${(_percentage * 100).round()}%',
            style: Theme.of(context).textTheme.headline4,
          ),
        )
      ),
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.globalToLocal(details.globalPosition);
    final center = Offset(renderBox.size.width / 2, renderBox.size.height / 2);
    final angle = atan2(position.dy - center.dy, position.dx - center.dx);

    setState(() {
      _percentage = (angle + pi) / (2 * pi);
      if (widget.onPercentageChanged != null) {
        widget.onPercentageChanged!(_percentage);
      }
    });
  }
}

class _DialPainter extends CustomPainter {
  final double percentage;

  _DialPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    final Paint foregroundPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * percentage,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
