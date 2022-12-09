import 'package:flutter/material.dart';
import 'package:kawarini_ketsudan/view/theme/my_color.dart';

class MyTextStyle {
  static TextStyle _textStyle({
    Color? color,
    required double fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      letterSpacing: letterSpacing,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle get black16 => _textStyle(fontSize: 16);

  static TextStyle get white20 {
    return _textStyle(color: MyColor.white, fontSize: 20);
  }

  static TextStyle get white10 {
    return _textStyle(color: MyColor.white, fontSize: 10);
  }
}
