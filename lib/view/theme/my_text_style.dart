import 'package:flutter/material.dart';
import 'package:kawarini_ketsudan/view/theme/my_color.dart';

class MyTextStyle {
  static TextStyle _textStyle({
    Color? color,
    double? fontSize,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle get black16 => _textStyle(fontSize: 16);

  static TextStyle get white10 {
    return _textStyle(color: MyColor.white, fontSize: 10);
  }

  static TextStyle get white => _textStyle(color: MyColor.white);

  static TextStyle get whiteUnderline {
    return _textStyle(
      color: MyColor.white,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle get white20 {
    return _textStyle(color: MyColor.white, fontSize: 20);
  }

  static TextStyle get white32LetterSpacing {
    return _textStyle(color: MyColor.white, fontSize: 32, letterSpacing: 32);
  }
}
