class User {
  final String fullName;
  final String username;
  final String password;
  final String confirmPassword;

  User({
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
      'confirmassword': confirmPassword,
    };
  }
}