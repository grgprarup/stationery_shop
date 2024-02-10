import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stationery_shop/src/screens/login_screen.dart';
import '../models/user.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<void> registerUser(User user) async {
    print('Registering user...');
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );
      print(jsonEncode(user.toJson()));
      if (response.statusCode == 302) {
        final redirectUrl = response.headers['location'];
        print('Redirected to $redirectUrl');

        if (redirectUrl != null) {
          final redirectResponse = await http.post(
            Uri.parse(redirectUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(user.toJson()),
          );
        }
      }
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        // TODO: handle registration success
        print('User registered successfully');
      } else {
        // TODO: handle registration error
      }
    } catch(e) {
      print('Error registering user: $e');

    }
  }
}