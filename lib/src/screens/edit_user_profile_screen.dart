import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/api_service.dart';

class EditUserProfileScreen extends StatefulWidget {
  final ApiService apiService;
  const EditUserProfileScreen({super.key, required this.apiService});


  @override
  _EditUserProfileScreenState createState() => _EditUserProfileScreenState(apiService: apiService);
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  ApiService apiService;

  _EditUserProfileScreenState({required this.apiService});

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;



  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  Future<ApiResponse> _registerUser() async {
    final user = UserUpdate(
      fullName: _fullNameController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );
    ApiResponse apiResponse = await widget.apiService.registerUser(user);
    return apiResponse;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}



  void _onRegistrationSuccess(BuildContext context) {
    _registerUser().then((apiResponse) {
      if (apiResponse.success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(apiService: apiService),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(apiResponse.message),
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
      appBar: AppBar(
        title: null,
      ),
      // backgroundColor: const Color(0xFF19B0E7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48.0),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
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
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _isConfirmPasswordVisible = true;
                      });
                    },
                    onLongPressUp: () {
                      setState(() {
                        _isConfirmPasswordVisible = false;
                      });
                    },
                    child: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                obscureText: !_isConfirmPasswordVisible,
              ),
              const SizedBox(height: 32.0),
              Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.35,
                  child: ElevatedButton(
                    onPressed: () => _onRegistrationSuccess(context),
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
                        Text('SIGN UP'),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?',
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginScreen(apiService: apiService)),
                      );
                    },
                    child: const Text(
                      'Sign in',
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
      ),
    );
  }
}
