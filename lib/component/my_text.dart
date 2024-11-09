import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;

  const MyText(
      {super.key,
      required this.title,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
        this.maxLines,
      this.decoration,
      this.overflow,
      this.height,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        decoration: decoration,
        decorationColor: Colors.blueAccent,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height
      ),
    );
  }
}
