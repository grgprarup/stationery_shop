import 'package:flutter/material.dart';
import 'package:stationery_shop/src/screens/splash_screen.dart';
import 'package:stationery_shop/src/services/api_service.dart';
import '../../env.dart';

void main() {
  const baseUrl = '${Env.apiBaseUrl}:${Env.apiPort}/${Env.apiPath}/${Env.apiVersion}';
  final apiService = ApiService(baseUrl: baseUrl);
  runApp(MyApp(apiService: apiService,));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({super.key, required this.apiService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stationery Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(apiService: apiService,),
    );
  }
}
