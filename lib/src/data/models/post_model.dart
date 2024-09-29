import 'package:social_app/src/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.userId,
    required super.username,
    required super.content,
    required super.userImage,
    required super.contentImage,
    required super.timestamp,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      username: json['username'],
      userImage: json['userImage'],
      contentImage: json['contentImage'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'content': content,
      'userImage': userImage,
      'contentImage': contentImage,
      'timestamp': timestamp,
    };
  }
}
