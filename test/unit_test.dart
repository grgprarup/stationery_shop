import 'package:flutter_test/flutter_test.dart';

import 'package:stationery_shop/src/utils/login_validator.dart';

void main() {
  group('Login Validator', () {
    test('returns error when username is empty', () {
      var result = LoginValidator.validateUsername('');
      expect(result, 'Username cannot be empty');
    });

    test('returns error when password is empty', () {
      var result = LoginValidator.validatePassword('');
      expect(result, 'Password cannot be empty');
    });

    test('returns error when password is empty', () {
      var result = LoginValidator.validatePassword('1');
      expect(result, 'Password must be at least 8 characters long');
    });

    test('returns null when username and password are valid', () {
      var usernameResult = LoginValidator.validateUsername('validUser');
      var passwordResult = LoginValidator.validatePassword('validPassword123');
      expect(usernameResult, null);
      expect(passwordResult, null);
    });
  });

  group('Password length validation', () {
    final passwordTests = [
      {'input': '1', 'expected': 'Password must be at least 8 characters long'},
      {'input': '12', 'expected': 'Password must be at least 8 characters long'},
      {'input': '123', 'expected': 'Password must be at least 8 characters long'},
      {'input': '1234', 'expected': 'Password must be at least 8 characters long'},
      {'input': '12345', 'expected': 'Password must be at least 8 characters long'},
      {'input': '123456', 'expected': 'Password must be at least 8 characters long'},
      {'input': '1234567', 'expected': 'Password must be at least 8 characters long'},
    ];

    passwordTests.forEach((test) {
      testWidgets('validatePassword for "${test['input']}"', (WidgetTester tester) async {
        expect(LoginValidator.validatePassword(test['input']!), test['expected']);
      });
    });
  });
}
