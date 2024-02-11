import 'package:flutter/material.dart';
import 'package:stationery_shop/src/screens/register_screen.dart';

import '../services/api_service.dart';

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
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
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
                  onPressed: () {
                    // TODO: Implement login functionality
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF19B0E7),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  child: const Row(
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
