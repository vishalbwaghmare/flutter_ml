import 'package:demo_application/inhetired_widget_demo/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeInherited.of(context);
  
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget demo"),),
        body: Center(
          child: Switch(
            value: theme.isDark, 
            onChanged: (_) => theme.toggleTheme(),
            ),
        ),
    );
  }
}