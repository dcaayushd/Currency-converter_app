import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/theme_provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  Future<void> _saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    _saveThemePreference();

    // Access themeProvider using BuildContext extension
    final themeProvider =
        context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    if (themeProvider != null) {
      // Call setTheme on the data (which is _ThemeProviderWidgetState)
      themeProvider.data.setTheme(
        Theme.of(context).copyWith(
          brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        ),
      );
    } else {
      // Handle the case where ThemeProvider is not found (optional)
      print("ThemeProvider not found in widget tree");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      data:
          ThemeProviderWidgetState(), // Pass ThemeProviderWidgetState instance
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode'),
                Switch(
                  value: _isDarkMode,
                  onChanged: (_) => _toggleTheme(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
