import 'dart:convert';
import 'package:http/http.dart' as http;

class GoldSilverAPI {
  static const String _apiUrl = 'https://www.nepalgoldandsilverprices.com/api';

  static Future<Map<String, dynamic>> fetchGoldSilverPrices() async {
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch gold and silver prices');
    }
  }
}
