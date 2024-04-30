import 'package:flutter/material.dart';

import '../services/api_service.dart';

class ViewFullUserProfileScreen extends StatefulWidget {
  final ApiService apiService;

  const ViewFullUserProfileScreen({super.key, required this.apiService});

  @override
  _ViewFullUserProfileScreenState createState() =>
      _ViewFullUserProfileScreenState(apiService: apiService);
}

class _ViewFullUserProfileScreenState extends State<ViewFullUserProfileScreen> {
  ApiService apiService;

  _ViewFullUserProfileScreenState({required this.apiService});

  int userId = 0;
  String accessToken = '';
  String refreshToken = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
        ),
        // backgroundColor: const Color(0xFF19B0E7),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
