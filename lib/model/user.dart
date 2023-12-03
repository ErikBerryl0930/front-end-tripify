class User {
  final int id;
  final String username;
  final String email;
  final String role;
  final String token; // Store the token for future requests
  // Add other user properties as needed

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.token,
  });
}
