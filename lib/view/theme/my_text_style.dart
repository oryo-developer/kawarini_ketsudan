import 'package:flutter/material.dart';
import 'package:kawarini_ketsudan/view/theme/my_color.dart';

class MyTextStyle {
  static TextStyle _textStyle({
    Color? color,
    double? fontSize,
    double? letterSpacing,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      color: color ?? MyColor.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  static TextStyle get black => _textStyle(color: MyColor.black);

  static TextStyle get white10 => _textStyle(fontSize: 10);

  static TextStyle get white => _textStyle();

  static TextStyle get whiteOverflow => _textStyle(overflow: TextOverflow.clip);

  static TextStyle get whiteUnderline {
    return _textStyle(decoration: TextDecoration.underline);
  }

  static TextStyle get white20 => _textStyle(fontSize: 20);

  static TextStyle get white32LetterSpacing {
    return _textStyle(fontSize: 32, letterSpacing: 32);
  }
}
