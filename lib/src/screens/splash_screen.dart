import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stationery_shop/src/services/api_service.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  final ApiService apiService;

  const SplashScreen({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(
            apiService: apiService,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Image.asset(
          'lib/src/assets/images/logo.png',
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.7,
        ),
      ),
    );
  }
}
