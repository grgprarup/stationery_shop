class UserRegister {
  final String fullName;
  final String username;
  final String password;
  final String confirmPassword;

  UserRegister({
    required this.fullName,
    required this.username,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'username': username,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}

class UserLogin {
  final String username;
  final String password;

  UserLogin({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
