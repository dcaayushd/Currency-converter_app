import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../widgets/currency_converter.dart';
import '../widgets/navigation_bar.dart' as custom_nav_bar;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    // Set the theme based on the toggle
    Theme.of(context).copyWith(
      brightness: _isDarkMode ? Brightness.dark : Brightness.light,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Iconsax.menu_1_outline),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Switch(
            value: _isDarkMode,
            onChanged: (value) {
              _toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: CurrencyConverter(),
      ),
      bottomNavigationBar: custom_nav_bar.NavigationBar(),
    );
  }
}
