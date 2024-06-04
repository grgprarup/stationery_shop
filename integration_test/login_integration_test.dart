import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stationery_shop/env.dart';
// import 'package:integration_test/integration_test.dart';
import 'package:stationery_shop/src/screens/login_screen.dart';
import 'package:stationery_shop/src/services/api_service.dart';

main() {
  const baseUrl = '${Env.apiBaseUrl}:${Env.apiPort}/${Env.apiPath}/${Env.apiVersion}';
  final apiService = ApiService(baseUrl: baseUrl);
  testWidgets('Integration testing login', (tester) async {
    await tester.pumpWidget(MaterialApp(title: 'Login Screen',home: LoginScreen(apiService: apiService)));
    await tester.pumpAndSettle();
  });
}