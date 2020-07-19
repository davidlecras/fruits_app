import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

enum FontOpacity { max, medium, min, none }

enum FontColor { white, dark, lightGrey, darkGrey, peach }

enum FontSize { xs, sm, md, lg, xl }

class CustomText extends StatelessWidget {
  final String text;
  final FontColor fontColor;
  final FontSize fontSize;
  final FontWeight fontWeight;
  final FontOpacity fontOpacity;
  final TextAlign alignment;
  final int maxLines;
  final bool underline;
  final TextOverflow overflowStyle;

  CustomText({
    @required this.text,
    @required this.fontColor,
    @required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.fontOpacity = FontOpacity.none,
    this.alignment = TextAlign.start,
    this.maxLines = 2,
    this.underline = false,
    this.overflowStyle = TextOverflow.ellipsis,
  });

  static Color textColor(FontColor fontColor) {
    Color color;
    switch (fontColor) {
      case FontColor.white:
        color = Colors.white;
        break;
      case FontColor.dark:
        color = Colors.black;
        break;
      case FontColor.lightGrey:
        color = const Color(0xff999999);
        break;
      case FontColor.darkGrey:
        color = const Color(0xff666666);
        break;
      case FontColor.peach:
        color = const Color(0xFFFF8152);
        break;
    }

    return color;
  }

  static double textSize(FontSize fontSize) {
    double size;
    switch (fontSize) {
      case FontSize.xs:
        size = 10;
        break;
      case FontSize.sm:
        size = 12;
        break;
      case FontSize.md:
        size = 16;
        break;
      case FontSize.lg:
        size = 22;
        break;
      case FontSize.xl:
        size = 32;
        break;
    }

    return size;
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return new DefaultTextStyle(
          style: new TextStyle(
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
            fontSize: textSize(fontSize),
            color: textColor(fontColor),
            fontWeight: fontWeight,
          ),
          child: new Text(
            text,
            maxLines: maxLines,
            overflow: overflowStyle,
            textAlign: alignment,
          ));
    } else {
      return new Text(
        text,
        maxLines: maxLines,
        overflow: overflowStyle,
        textAlign: alignment,
        style: new TextStyle(
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          fontSize: textSize(fontSize),
          color: textColor(fontColor),
          fontWeight: fontWeight,
        ),
      );
    }
  }
}
