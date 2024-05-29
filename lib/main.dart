import 'package:flutter/material.dart';
import 'package:stationery_shop/src/screens/splash_screen.dart';
import 'package:stationery_shop/src/services/api_service.dart';
import '../../env.dart';

void main() {
  const baseUrl = '${Env.apiBaseUrl}:${Env.apiPort}/${Env.apiPath}/${Env.apiVersion}';
  final apiService = ApiService(baseUrl: baseUrl);
  runApp(InventoryApp(apiService: apiService,));
}

class InventoryApp extends StatelessWidget {
  final ApiService apiService;

  const InventoryApp({super.key, required this.apiService});

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
