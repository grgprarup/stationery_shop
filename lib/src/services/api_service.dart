import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../utils/http_helper.dart';

class ApiResponse {
  final bool success;
  final String message;

  ApiResponse({required this.success, required this.message});
}

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<ApiResponse> registerUser(User user) async {
    bool isSuccess = false;
    try {
      final response =
          await _makeRequest(baseUrl, 'users/', 'POST', user.toJson(), null);

      final responseMessage =
          (json.decode(response.body))['message'].toString();

      if (response.statusCode == 201) {
        isSuccess = true;
      }
      return ApiResponse(success: isSuccess, message: responseMessage);
    } catch (e) {
      return ApiResponse(success: isSuccess, message: e.toString());
    }
  }

  Future<http.Response> _makeRequest(String baseUrl, String endpoint,
      String method, Object? body, Encoding? encoding) async {
    final httpHelper = HttpHelper(
        fullUrl: '$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
        encoding: encoding);

    switch (method) {
      case 'GET':
        return await httpHelper.get();
      case 'POST':
        return await httpHelper.post();
      case 'PUT':
        return await httpHelper.put();
      case 'DELETE':
        return await httpHelper.delete();
      default:
        throw Exception('Invalid Method: $method');
    }
  }
}
