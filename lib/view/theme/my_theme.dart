import 'package:flutter/material.dart';
import 'package:kawarini_ketsudan/view/theme/my_color.dart';

class MyTheme {
  static ThemeData get themeData {
    return ThemeData(
      iconTheme: const IconThemeData(color: MyColor.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: MyColor.amber,
          shadowColor: MyColor.transparent,
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 32,
          ),
        ),
      ),
    );
  }
}
