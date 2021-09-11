import 'package:flutter/material.dart';

// https://medium.com/flutter-community/flutter-sliders-demystified-4b3ea65879c

class CustomSliderThumbRect extends SliderComponentShape {
  final double thumbRadius;
  final int thumbHeight;
  final int min;
  final int max;

  const CustomSliderThumbRect({
    required this.thumbRadius,
    required this.thumbHeight,
    required this.min,
    required this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    required double value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: center,
          width: thumbHeight * 2.0,
          height: thumbHeight.toDouble()),
      Radius.circular(thumbRadius * .4),
    );

    final paint = Paint()
      ..color = Colors.blueGrey
      //sliderTheme?.activeTrackColor ?? Colors.amber //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
        style: new TextStyle(
            fontSize: thumbHeight * .5,
            fontWeight: FontWeight.w700,
            color: sliderTheme?.thumbColor,
            height: 1),
        text: '${getValue(value)}');
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawRRect(rRect, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    // return (min + (max - min) * value).round().toString();
    return value.toStringAsFixed(4);
  }
}
