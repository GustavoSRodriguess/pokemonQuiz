import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static Future<Map<String, dynamic>> getData(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao baixar dados ${response.statusCode}');
    }
  }
}
