import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSwitcher extends StatefulWidget {
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
          _ThemeProviderWidgetState(), // Pass _ThemeProviderWidgetState instance
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode'),
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

class ThemeProvider extends InheritedWidget {
  final _ThemeProviderWidgetState data;

  ThemeProvider({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  static ThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
  }

  @override
  bool updateShouldNotify(ThemeProvider old) => data != old.data;
}

class ThemeProviderWidget extends StatefulWidget {
  final Widget child;

  ThemeProviderWidget({required this.child});

  @override
  _ThemeProviderWidgetState createState() => _ThemeProviderWidgetState();
}

class _ThemeProviderWidgetState extends State<ThemeProviderWidget> {
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
