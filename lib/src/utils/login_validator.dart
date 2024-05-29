class LoginValidator {
  static String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'Username cannot be empty';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    if(password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}
