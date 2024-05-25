import 'package:flutter/material.dart';
import '../widgets/gold_silver_widget.dart';

class GoldSilverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gold and Silver Prices'),
      ),
      body: GoldSilverWidget(),
    );
  }
}
