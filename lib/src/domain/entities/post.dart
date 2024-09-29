import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String userId;
  final String username;
  final String content;
  final String userImage;
  final String contentImage;
  final DateTime timestamp;

  Post.empty()
      : this(
          id: "1",
          userId: "1",
          username: "",
          content: "",
          userImage: "",
          contentImage: "",
          timestamp: DateTime.parse("2024-09-25T12:34:56Z"),
        );

  const Post({
    required this.id,
    required this.userId,
    required this.username,
    required this.content,
    required this.userImage,
    required this.contentImage,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        username,
        content,
        userImage,
        contentImage,
        timestamp,
      ];
}
