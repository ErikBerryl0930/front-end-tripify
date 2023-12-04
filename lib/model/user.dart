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
      username: json['user']['username'],
      email: json['user']['email'] ?? '',
      password: json['user']['password'] ?? '',
      role: json['user']['role'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserData(username: $username, email: $email, role: $role)';
  }
}
