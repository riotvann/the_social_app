import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String profilePicture;
  final String bio;

  const User({
    required this.id,
    required this.username,
    required this.profilePicture,
    this.bio = '',
  });

  @override
  List<Object?> get props => [
        id,
        username,
        profilePicture,
        bio,
      ];
}
