import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeProviderWidgetState data;

  const ThemeProvider({
    super.key,
    required super.child,
    required this.data,
  });

  static ThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => data != oldWidget.data;
}

class ThemeProviderWidget extends StatefulWidget {
  final Widget child;

  const ThemeProviderWidget({super.key, required this.child});

  @override
  ThemeProviderWidgetState createState() => ThemeProviderWidgetState();
}

class ThemeProviderWidgetState extends State<ThemeProviderWidget> {
  ThemeData _themeData = ThemeData.light();

  void setTheme(ThemeData themeData) {
    setState(() {
      _themeData = themeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      data: this, // Pass _ThemeProviderWidgetState instance
      child: Theme(
        data: _themeData,
        child: widget.child,
      ),
    );
  }
}
