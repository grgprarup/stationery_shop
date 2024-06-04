import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:stationery_shop/env.dart';
import 'package:stationery_shop/src/screens/login_screen.dart';
import 'package:stationery_shop/src/services/api_service.dart';

void main() {
  const baseUrl = '${Env.apiBaseUrl}:${Env.apiPort}/${Env.apiPath}/${Env.apiVersion}';
  ApiService apiService = ApiService(baseUrl: baseUrl);
  testGoldens('Login Page', (WidgetTester tester) async {
    final builder = DeviceBuilder()
    ..addScenario(widget: LoginScreen(apiService: apiService));

    await tester.pumpDeviceBuilder(builder, wrapper: materialAppWrapper(theme: ThemeData(primaryColor: Colors.red)));

    await screenMatchesGolden(tester, "login_page");
  });
}
