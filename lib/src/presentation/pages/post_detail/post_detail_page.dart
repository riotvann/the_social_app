import 'package:flutter/material.dart';
import 'package:social_app/src/domain/entities/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.username),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post.userImage),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Text(
                    post.content,
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Image.network(post.contentImage),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Posted on ${post.timestamp.toLocal()}',
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
