import 'dart:convert';

import 'package:guia_de_moteis/core/http/interface/i_http_repository.dart';
import 'package:http/http.dart' as http;

class HttpRepository implements IHttpRepository {
  var client = http.Client();
  String get _baseUrl => 'https://www.jsonkeeper.com/b/';

  @override
  Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse(_baseUrl + url));
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  }
}
