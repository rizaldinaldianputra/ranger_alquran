import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webview_rizaldi/models/M_surat.dart';

class AdzanApi {
  static Future<List<Surat>> getSurats(String query) async {
    final url = Uri.parse('https://api.npoint.io/99c279bb173a6e28359c/data');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List surats = json.decode(response.body);

      return surats.map((json) => Surat.fromJson(json)).where((surat) {
        final titleLower = surat.nama.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
