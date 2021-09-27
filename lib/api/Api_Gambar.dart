import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webview_rizaldi/models/M_gambar.dart';

class GambarApi {
  static Future<List<Gambar>> getGambar(String query) async {
    final url = Uri.parse(
        'https://islamic-api-indonesia.herokuapp.com/api/data/gambar');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List gambars = json.decode(response.body);

      return gambars.map((json) => Gambar.fromJson(json)).where((gambar) {
        final titleLower = gambar.image.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
