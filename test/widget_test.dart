import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stationery_shop/main.dart';
import 'package:stationery_shop/src/screens/login_screen.dart';
import 'package:stationery_shop/src/services/api_service.dart';

void main() {
  late MaterialApp app;
  final apiService = ApiService(baseUrl: 'http://192.168.1.70:5000/api/v1.0');

  setUp(() {
    app = MaterialApp(home: LoginScreen(apiService: apiService));
  });

  group('LoginScreen Widget Tests ', () {
    group('Field Presence Tests', () {
      testWidgets('title and instruction', (WidgetTester tester) async {
        await tester.pumpWidget(app);
        expect(find.text('Login'), findsOneWidget);
        expect(find.text('Please sign in to continue.'), findsOneWidget);
      });

      testWidgets('username field', (WidgetTester tester) async {
        await tester.pumpWidget(app);
        expect(find.byType(TextFormField), findsNWidgets(2));
        expect(find.byKey(const Key('usernameField')), findsOneWidget);
      });

      testWidgets('password field', (WidgetTester tester) async {
        await tester.pumpWidget(app);
        expect(find.byType(TextFormField), findsNWidgets(2));
        expect(find.byKey(const Key('passwordField')), findsOneWidget);
      });

      testWidgets('eye icon in password field', (WidgetTester tester) async {
        await tester.pumpWidget(app);
        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('login button', (WidgetTester tester) async {
        await tester.pumpWidget(app);
        expect(find.byType(ElevatedButton), findsOneWidget);
        expect(find.byKey(const Key('loginButton')), findsOneWidget);
        expect(find.text('LOGIN'), findsOneWidget);
        expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      });

      testWidgets('forgot password button', (WidgetTester tester) async {
        await tester.pumpWidget(app);
        expect(find.byType(TextButton), findsNWidgets(2));
        expect(find.byKey(const Key('forgotPasswordButton')), findsOneWidget);
        expect(find.text('Forgot Password?'), findsOneWidget);
      });

      testWidgets('do not have an account', (WidgetTester tester) async {
        await tester.pumpWidget(app);
        expect(find.text('Don\'t have an account?'), findsOneWidget);
      });

      testWidgets('sign up button', (WidgetTester tester) async {
        await tester.pumpWidget(app);
        expect(find.byType(TextButton), findsNWidgets(2));
        expect(find.byKey(const Key('signUpButton')), findsOneWidget);
        expect(find.text('Sign up'), findsOneWidget);
      });
    });

    group('Login Functionality Tests', () {
      testWidgets('Valid login navigates to home screen', (WidgetTester tester) async {
        await tester.pumpWidget(app);

        await tester.enterText(find.byKey(const Key('usernameField')), 'admin');
        await tester.enterText(find.byKey(const Key('passwordField')), 'admin');

        await tester.tap(find.byKey(const Key('loginButton')));
        await tester.pumpAndSettle();

        expect(find.text('Dashboard'), findsOneWidget);
        expect(find.byIcon(Icons.home_rounded), findsOneWidget);
      });
    });
  });
}
