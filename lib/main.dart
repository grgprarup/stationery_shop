import 'package:flutter/material.dart';
import 'package:stationery_shop/src/screens/splash_screen.dart';
import 'package:stationery_shop/src/services/api_service.dart';

void main() {
  final apiService = ApiService(baseUrl: 'http://10.0.2.2:5000/api/v1.0');
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
