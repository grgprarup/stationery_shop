import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

// StepDefinitionGeneric userIsOnTheLoginScreen() {
//   return given<FlutterWorld>(
//     'user is on the login screen',
//     (context) async {
//       final loginScreenLocator = find.text('Login');
//     expect(loginScreenLocator, "Login");
//     },
//   );
// }

// class UserIsOnTheLoginScreen extends GivenWithWorld<FlutterWorld> {
//   @override
//   RegExp get pattern => RegExp(r"user is on the login screen");
//
//   @override
//   Future<void> executeStep() async {
//     final loginScreenLocator = find.text('Login');
//     expect(loginScreenLocator, findsOneWidget);
//   }
// }

StepDefinitionGeneric userLogsInWithUsernameAndPassword() {
  return when2<String, String, FlutterWorld>(
    'user logs in with username {string} and password {string}',
    (username, password, context) async {
      final usernameFieldLocator = find.byValueKey(const Key('usernameField'));
      await FlutterDriverUtils.enterText(context.world.driver, usernameFieldLocator, username);

      final passwordFieldLocator = find.byValueKey(const Key('passwordField'));
      await context.world.driver
          ?.tap(passwordFieldLocator);
      await context.world.driver?.enterText(password);

      final loginButtonLocator = find.byValueKey(const Key('loginButton'));
      await context.world.driver?.tap(loginButtonLocator);
    },
  );
}

// class UserLogsInWithUsernameAndPassword
//     extends When2WithWorld<String, String, FlutterWorld> {
//   @override
//   RegExp get pattern =>
//       RegExp(r"user logs in with username {string} and password {string}");
//
//   @override
//   Future<void> executeStep(username, password) async {
//     final usernameFieldLocator = find.byKey(const Key('usernameField'));
//     await world.driver?.tap(usernameFieldLocator as SerializableFinder);
//     await world.driver?.enterText(username);
//
//     final passwordFieldLocator = find.byKey(const Key('passwordField'));
//     await world.driver?.tap(passwordFieldLocator as SerializableFinder);
//     await world.driver?.enterText(password);
//
//     final loginButtonLocator = find.byKey(const Key('loginButton'));
//     await world.driver?.tap(loginButtonLocator as SerializableFinder);
//   }
// }

// StepDefinitionGeneric userShouldBeRedirectedToTheDashboardScreen() {
//   return then<FlutterWorld>(
//     'user should be redirected to the dashboard screen',
//     (context) async {
//       final dashboardLocator = find.byKey(const Key('dashboard'));
//       final actualText = dashboardLocator.evaluate().first.widget.toString();
//       context.expectMatch(actualText, 'Dashboard');
//     },
//   );
// }

// class UserShouldBeRedirectedToTheDashboardScreen
//     extends ThenWithWorld<FlutterWorld> {
//   @override
//   RegExp get pattern =>
//       RegExp(r"user should be redirected to the dashboard screen");
//
//   @override
//   Future<void> executeStep() async {
//     final dashboardLocator = find.byKey(const Key('dashboard'));
//     final actualText = dashboardLocator.evaluate().first.widget.toString();
//     expectMatch(actualText, 'Dashboard');
//   }
// }
