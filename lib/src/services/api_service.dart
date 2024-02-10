import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

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
      final response = await http.post(
        Uri.parse('$baseUrl/users/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );
      final responseMessage = (json.decode(response.body))['message'].toString();

      if (response.statusCode == 201) {
        isSuccess = true;
        return ApiResponse(
            success: isSuccess, message: responseMessage);
      } else {
        return ApiResponse(
            success: isSuccess, message: responseMessage);
      }
    } catch (e) {
      return ApiResponse(success: isSuccess, message: e.toString());
    }
  }
}
