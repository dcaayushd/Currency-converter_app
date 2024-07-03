import 'package:flutter/material.dart';
import 'package:currency_converter_app/utils/constants.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final _textController = TextEditingController();
  String _selectedFromCurrency = Constants.baseCurrency;
  String _selectedToCurrency = Constants.baseCurrency;
  double _result = 0.0;

  void _convert() {
    // Implement the logic to convert the amount from the selected "from" currency to the selected "to" currency
    // You can use the exchange rates from the Constants.currencies list
    // and perform the necessary calculations to get the result
    setState(() {
      _result = 100.0; // Replace with the actual conversion result
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Currency Converter',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                value: _selectedFromCurrency,
                onChanged: (value) {
                  setState(() {
                    _selectedFromCurrency = value!;
                  });
                },
                items: Constants.currencies
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: DropdownButton<String>(
                value: _selectedToCurrency,
                onChanged: (value) {
                  setState(() {
                    _selectedToCurrency = value!;
                  });
                },
                items: Constants.currencies
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _textController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter amount',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _convert,
          child: const Text('Convert'),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Result: $_result',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
