class UserData {
  final String? username;
  final String email;
  final String password;
  final String role;

  UserData({
    this.username,
    required this.email,
    required this.password,
    required this.role,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['username'],
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
    );
  }
}
