class UserModel {
  int id;
  String name;
  String email;
  String username;
  String profile_photo_url;
  String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.profile_photo_url,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      profile_photo_url: json['profile_photo_url'] as String,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profile_photo_url,
      'token': token,
    };
  }
}
