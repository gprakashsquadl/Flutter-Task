import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<dynamic>> getMethod(String url) async {
    final response = await http.get(Uri.parse(url),
        headers: {'authorization': "", "content-type": "application/json"});

    return json.decode(response.body);
  }
}
