import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String fullUrl;
  final Map<String, String> headers;
  final Object? body;
  final Encoding? encoding;

  HttpHelper({required this.fullUrl, required this.headers, this.body, this.encoding});

  Future<http.Response> get() async {
    return await http.get(
      Uri.parse(fullUrl),
      headers: headers,
    );
  }

  Future<http.Response> post() async {
    return await http.post(
      Uri.parse(fullUrl),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> put() async {
    return await http.put(
      Uri.parse(fullUrl),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> delete() async {
    return await http.delete(
      Uri.parse(fullUrl),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }
}