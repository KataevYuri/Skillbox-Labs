import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  final Color? color;

  const AppTheme({super.key, required super.child, required this.color});

  static AppTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return color != oldWidget.color;
  }
}
