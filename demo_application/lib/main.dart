import 'package:demo_application/inhetired_widget_demo/home_page.dart';
import 'package:demo_application/inhetired_widget_demo/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() => isDark = !isDark);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      isDark: isDark, 
      toggleTheme: toggleTheme,
       child: MaterialApp(
        theme: isDark ? ThemeData.dark() : ThemeData.light(),
        home: HomePage(),
       )
       );
  }
}