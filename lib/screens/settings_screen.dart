import 'package:flutter/material.dart';
import '../widgets/theme_switcher.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ThemeSwitcher(),
    );
  }
}
