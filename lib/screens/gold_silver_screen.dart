import 'package:flutter/material.dart';
import '../widgets/gold_silver_widget.dart';

class GoldSilverScreen extends StatelessWidget {
  const GoldSilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gold and Silver Prices'),
      ),
      body: GoldSilverWidget(),
    );
  }
}
