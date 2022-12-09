import 'package:flutter/material.dart';
import 'package:kawarini_ketsudan/view/theme/my_color.dart';
import 'package:kawarini_ketsudan/view/theme/my_text_style.dart';

class MyTheme {
  static ThemeData get themeData {
    return ThemeData(
      splashColor: MyColor.transparent,
      highlightColor: MyColor.transparent,
      iconTheme: const IconThemeData(color: MyColor.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: MyColor.amber,
          shadowColor: MyColor.transparent,
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: MyTextStyle.white32LetterSpacing,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MyColor.white,
          textStyle: MyTextStyle.whiteUnderline,
          splashFactory: NoSplash.splashFactory,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 17),
        suffixIconColor: MyColor.white,
      ),
    );
  }
}
