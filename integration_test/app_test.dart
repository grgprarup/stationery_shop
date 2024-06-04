import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stationery_shop/env.dart';
import 'package:stationery_shop/main.dart';
import 'package:stationery_shop/src/screens/home_screen.dart';
import 'package:stationery_shop/src/screens/login_screen.dart';
import 'package:stationery_shop/src/screens/register_screen.dart';
import 'package:stationery_shop/src/screens/splash_screen.dart';
import 'package:stationery_shop/src/services/api_service.dart';

void main() {
  const baseUrl = '${Env.apiBaseUrl}:${Env.apiPort}/${Env.apiPath}/${Env.apiVersion}';
  final apiService = ApiService(baseUrl: baseUrl);
  group('end-to-end test', () {
    testWidgets('tap on the sign up text button', (tester) async {
      await tester.pumpWidget(InventoryApp(apiService: apiService));

      expect(find.byType(SplashScreen), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);

      final signUpButton = find.byKey(const Key('signUpButton'));
      await tester.tap(signUpButton);

      await tester.pumpAndSettle();

      expect(find.byType(RegisterScreen), findsOneWidget);
      expect(find.text('Create an Account'), findsOneWidget);
    });

    testWidgets('tap on the login button', (tester) async {
      await tester.pumpWidget(InventoryApp(apiService: apiService));

      expect(find.byType(SplashScreen), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);

      final usernameField = find.byKey(const Key('usernameField'));
      await tester.enterText(usernameField, 'admin');
      final passwordField = find.byKey(const Key('passwordField'));
      await tester.enterText(passwordField, 'admin');
      final loginButton = find.byKey(const Key('loginButton'));
      await tester.tap(loginButton);

      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.text('Dashboard'), findsOneWidget);
    }, skip: true);
  });
}