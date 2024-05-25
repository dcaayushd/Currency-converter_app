import 'package:flutter/material.dart';
import '../services/gold_silver_api.dart';

class GoldSilverWidget extends StatefulWidget {
  @override
  _GoldSilverWidgetState createState() => _GoldSilverWidgetState();
}

class _GoldSilverWidgetState extends State<GoldSilverWidget> {
  Map<String, dynamic>? _goldSilverPrices;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchGoldSilverPrices();
  }

  Future<void> _fetchGoldSilverPrices() async {
    try {
      final prices = await GoldSilverAPI.fetchGoldSilverPrices();
      setState(() {
        _goldSilverPrices = prices;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch gold and silver prices'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gold and Silver Prices',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16.0),
                _buildPriceCard(
                  title: 'Gold Price',
                  price: _goldSilverPrices?['gold_price'],
                ),
                SizedBox(height: 16.0),
                _buildPriceCard(
                  title: 'Silver Price',
                  price: _goldSilverPrices?['silver_price'],
                ),
              ],
            ),
    );
  }

  Widget _buildPriceCard({required String title, required String? price}) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8.0),
            Text(
              price ?? 'N/A',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
