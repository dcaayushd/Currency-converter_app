import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyAPI {
  static const String _apiUrl = 'https://api.exchangeratesapi.io/latest';

  static Future<Map<String, dynamic>> fetchExchangeRates(String baseCurrency) async {
    final response = await http.get(Uri.parse('$_apiUrl?base=$baseCurrency'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch exchange rates');
    }
  }
}
