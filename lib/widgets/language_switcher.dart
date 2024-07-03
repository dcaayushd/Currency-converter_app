import 'package:flutter/material.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  String _selectedLanguage = 'English'; // Default language

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
      // Implement logic to change the app language based on the selected language
      // This can involve using packages like flutter_localizations for internationalization
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select App Language:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        DropdownButton<String>(
          value: _selectedLanguage,
          onChanged: (String? language) {
            if (language != null) {
              _changeLanguage(language);
            }
          },
          items: <String>['English', 'Spanish', 'French', 'German'] // Add more languages as needed
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
