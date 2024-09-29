import 'package:social_app/src/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.username,
      super.bio,
      required super.profilePicture});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        username: json['username'],
        bio: json['bio'],
        profilePicture: json['profilePicture']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'bio': bio,
      'profilePicture': profilePicture,
    };
  }
}
