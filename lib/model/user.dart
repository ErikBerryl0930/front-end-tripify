class UserData {
  final String? username;
  final String email;
  final String password;
  final String role;
  Profile profile;

  UserData({
    this.username,
    required this.email,
    required this.password,
    required this.role,
    required this.profile,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['user']['username'],
      email: json['user']['email'] ?? '',
      password: json['user']['password'] ?? '',
      role: json['user']['role'] ?? '',
      profile: Profile.fromJson(json['user']["profile"] ?? ''),
    );
  }

  @override
  String toString() {
    return 'UserData(username: $username, email: $email, role: $role, profile: $profile)';
  }
}

class Profile {
  String fullname;
  String address;
  String country;
  String phone;
  String profileImage;

  Profile({
    required this.fullname,
    required this.address,
    required this.country,
    required this.phone,
    required this.profileImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        fullname: json["fullname"],
        address: json["address"],
        country: json["country"],
        phone: json["phone"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "address": address,
        "country": country,
        "phone": phone,
        "profile_image": profileImage,
      };

}
