import 'package:flutter/material.dart';

class ThemeInherited extends InheritedWidget {
  final bool isDark;
  final void Function() toggleTheme;

  const ThemeInherited({super.key, 
    required this.isDark,
    required this.toggleTheme,
    required super.child,
  });

  static ThemeInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInherited>()!;
  }

  @override
  bool updateShouldNotify(ThemeInherited oldWidget) {
    return isDark != oldWidget.isDark;
  }
}
