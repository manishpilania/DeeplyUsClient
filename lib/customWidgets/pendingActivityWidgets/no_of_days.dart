import 'package:deeply_us_project/configs/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;



List<double> endAngleList = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4.5, 5.5, 7];


class NoOfDaysWidget extends StatefulWidget {
  final int days;
  final double height;
  final double width;

  const NoOfDaysWidget({
    Key? key,
    required this.days,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _NoOfDaysWidgetState createState() => _NoOfDaysWidgetState();
}

class _NoOfDaysWidgetState extends State<NoOfDaysWidget> {
  @override
  Widget build(BuildContext context) {
    Color circleColor = Colors.red; // Default color for values outside the defined ranges
    double endAngle = 1.5; // Default endAngle for values outside the defined ranges

    // Check the range of days and update color and endAngle accordingly
    if (widget.days >= 1 && widget.days <= 10) {
      circleColor = colorList[0];
      endAngle = endAngleList[0];
    } else if (widget.days > 10 && widget.days <= 20) {
      circleColor = colorList[1];
      endAngle = endAngleList[1];
    } else if (widget.days > 20 && widget.days <= 30) {
      circleColor = colorList[2];
      endAngle = endAngleList[2];
    } else if (widget.days > 30 && widget.days <= 40) {
      circleColor = colorList[3];
      endAngle = endAngleList[3];
    } else if (widget.days > 40 && widget.days <= 50) {
      circleColor = colorList[4];
      endAngle = endAngleList[4];
    } else if (widget.days > 50 && widget.days <= 60) {
      circleColor = colorList[5];
      endAngle = endAngleList[5];
    } else if (widget.days > 60 && widget.days <= 70) {
      circleColor = colorList[6];
      endAngle = endAngleList[6];
    } else if (widget.days > 70 && widget.days <= 80) {
      circleColor = colorList[7];
      endAngle = endAngleList[7];
    } else if (widget.days > 80 && widget.days <= 90) {
      circleColor = colorList[8];
      endAngle = endAngleList[8];
    } else if (widget.days > 90 && widget.days <= 100) {
      circleColor = colorList[9];
      endAngle = endAngleList[9];
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: CustomPaint(
        painter: CirclePainter(circleColor, endAngle),
        child: Center(
          child: Container(
            width: widget.width * 0.74,
            height: widget.height * 0.74,
            decoration:const BoxDecoration(
              color: Color(0xFFff9797),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.days.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Days',
                  style: GoogleFonts.poppins(
                    fontSize: 6,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  final double endAngle;

  CirclePainter(this.color, this.endAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 4;

    const double startAngle = -1.5;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      endAngle,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
