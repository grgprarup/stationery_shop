import 'package:flutter/material.dart';
import 'package:stationery_shop/src/screens/register_screen.dart';

import '../models/user.dart';
import '../services/api_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  final ApiService apiService;

  const LoginScreen({super.key, required this.apiService});

  @override
  _LoginScreenState createState() => _LoginScreenState(apiService: apiService);
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  ApiService apiService;

  _LoginScreenState({required this.apiService});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<ApiResponse> _loginUser() async {
    final user = UserLogin(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    ApiResponse apiResponse = await widget.apiService.loginUser(user.username, user.password);

    return apiResponse;
  }

  _onLoginSuccess(BuildContext context) {
    _loginUser().then((apiResponse) {
      if (apiResponse.success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(apiService: apiService),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(apiResponse.message),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF19B0E7),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Please sign in to continue.',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF7D7D7D),
              ),
            ),
            const SizedBox(height: 48.0),
            TextFormField(
              key: const ValueKey('usernameField'),
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              key: const ValueKey('passwordField'),
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      _isPasswordVisible = true;
                    });
                  },
                  onLongPressUp: () {
                    setState(() {
                      _isPasswordVisible = false;
                    });
                  },
                  child: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              obscureText: !_isPasswordVisible,
            ),
            const SizedBox(height: 32.0),
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 0.35,
                child: ElevatedButton(
                  onPressed: () => _onLoginSuccess(context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF19B0E7),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  child: const Row(
                    key: ValueKey('loginButton'),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('LOGIN'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            TextButton(
              onPressed: () {
                // TODO: Implement forgot password functionality
              },
              child: const Text(
                key: ValueKey('forgotPasswordButton'),
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xFF19B0E7),
                  fontSize: 16.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 16.0,
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RegisterScreen(apiService: apiService)),
                    );
                  },
                  child: const Text(
                    key: ValueKey('signUpButton'),
                    'Sign up',
                    style: TextStyle(
                      color: Color(0xFF19B0E7),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
