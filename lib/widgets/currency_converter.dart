import 'package:flutter/material.dart';
import '../services/currency_api.dart';
import '../utils/constants.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String _baseCurrency = Constants.baseCurrency;
  String _targetCurrency = 'NPR';
  double _amount = 100.0;
  double _exchangeRate = 1.0;
  double _convertedAmount = 0.0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchExchangeRates();
  }

  Future<void> _fetchExchangeRates() async {
    try {
      final rates = await CurrencyAPI.fetchExchangeRates(_baseCurrency);
      setState(() {
        _exchangeRate = rates['rates'][_targetCurrency];
        _convertedAmount = _amount * _exchangeRate;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch exchange rates'),
        ),
      );
    }
  }

  void _convertCurrency() {
    setState(() {
      _convertedAmount = _amount * _exchangeRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Currency Converter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16.0),
        _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter amount',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _amount = double.parse(value);
                      });
                      _convertCurrency();
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: _baseCurrency,
                          items: Constants.currencies
                              .map((currency) => DropdownMenuItem(
                                    value: currency,
                                    child: Text(currency),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _baseCurrency = value!;
                            });
                            _fetchExchangeRates();
                          },
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: DropdownButton<String>(
                          value: _targetCurrency,
                          items: Constants.currencies
                              .map((currency) => DropdownMenuItem(
                                    value: currency,
                                    child: Text(currency),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _targetCurrency = value!;
                            });
                            _fetchExchangeRates();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '$_amount $_baseCurrency = $_convertedAmount $_targetCurrency',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
      ],
    );
  }
}
