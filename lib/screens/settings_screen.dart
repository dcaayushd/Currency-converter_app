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
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemeSwitcher(),
            SizedBox(height: 16.0),
            CurrencyCharts(),
            SizedBox(height: 16.0),
            CurrencyNews(),
            SizedBox(height: 16.0),
            CurrencyNotifications(),
            SizedBox(height: 16.0),
            OfflineMode(),
            SizedBox(height: 16.0),
            ConversionHistory(),
            SizedBox(height: 16.0),
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
