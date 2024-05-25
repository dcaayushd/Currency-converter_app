import 'package:flutter/material.dart';
import '../widgets/theme_switcher.dart';
import '../widgets/conversion_history.dart';
import '../widgets/favorite_currencies.dart';
import '../widgets/offline_mode.dart';
import '../widgets/currency_news.dart';
import '../widgets/currency_charts.dart';
import '../widgets/currency_notifications.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemeSwitcher(),
            const SizedBox(height: 16.0),
            CurrencyCharts(),
            const SizedBox(height: 16.0),
            CurrencyNews(),
            const SizedBox(height: 16.0),
            CurrencyNotifications(),
            const SizedBox(height: 16.0),
            OfflineMode(),
            const SizedBox(height: 16.0),
            ConversionHistory(),
            const SizedBox(height: 16.0),
            FavoriteCurrencies(),
          ].map((widget) {
            return Theme(
              data: Theme.of(context),
              child: widget,
            );
          }).toList(),
        ),
      ),
    );
  }
}
