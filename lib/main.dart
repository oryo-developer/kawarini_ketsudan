import 'package:flutter/material.dart';
import 'package:kawarini_ketsudan/view/page/home_page.dart';
import 'package:kawarini_ketsudan/view/theme/my_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeData,
      home: const HomePage(),
    );
  }
}
