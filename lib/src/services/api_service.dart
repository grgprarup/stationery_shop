import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<ApiResponse> registerUser(UserRegister user) async {

      final response =
          await _makeRequest(baseUrl, 'users/', 'POST', body: user.toJson());

      final responseMessage =
          (json.decode(response.body))['message'].toString();

      if (response.statusCode != 201) {
        return ApiResponse(success: false, message: responseMessage);
      }

      return ApiResponse(success: true, message: responseMessage);
  }

  Future<ApiResponse> loginUser(String username, String password) async {
    final response = await _makeRequest(baseUrl, 'auth/login/', 'POST',
        body: {'username': username, 'password': password});
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiResponse(success: false, message: responseData['message']);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', responseData['access_token']);
    prefs.setString('refresh_token', responseData['refresh_token']);

    return ApiResponse(success: true, message: 'Login Successful');
  }


  Future<ApiResponse> getUser(String userId) async {
    final response = await _makeRequest(baseUrl, 'users/$userId', 'GET');
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiResponse(success: false, message: responseData['message']);
    }

    return ApiResponse(success: true, message: 'User retrieved successfully');
  }

  Future<ApiResponse> updateUser(UserUpdate user) async {
    final userId = getUserId();
    final response =
    await _makeRequest(baseUrl, 'users/${userId}', 'PUT', body: user.toJson());

    final responseMessage =
    (json.decode(response.body))['message'].toString();

    if (response.statusCode != 201) {
      return ApiResponse(success: false, message: responseMessage);
    }

    return ApiResponse(success: true, message: responseMessage);
  }

  Future<http.Response> _makeRequest(
      String baseUrl, String endpoint, String method,
      {Object? body, Encoding? encoding}) async {
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
