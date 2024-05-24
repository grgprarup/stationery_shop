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

    final responseMessage = (json.decode(response.body))['message'].toString();

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

  Future<ApiResponse> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access_token');
    final response = await _makeRequest(baseUrl, 'auth/logout/', 'DELETE',
        token: accessToken);
    if (response.statusCode != 204) {
      return ApiResponse(success: false, message: 'Logout Failed');
    }
    prefs.clear();
    return ApiResponse(success: true, message: 'Successfully Logged Out');
  }

  Future<http.Response> _makeRequest(
      String baseUrl, String endpoint, String method,
      {Object? body, Encoding? encoding, String? token}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    // TODO: use setting headers in standard way
    if (token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }
    final httpHelper = HttpHelper(
        fullUrl: '$baseUrl/$endpoint',
        headers: headers,
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
