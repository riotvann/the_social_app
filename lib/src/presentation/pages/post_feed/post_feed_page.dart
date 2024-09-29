import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/src/presentation/bloc/post_feed/post_feed_bloc.dart';
import 'package:social_app/src/presentation/pages/post_detail/post_detail_page.dart';

class PostFeedPage extends StatefulWidget {
  const PostFeedPage({super.key});

  @override
  State<PostFeedPage> createState() => _PostFeedPageState();
}

class _PostFeedPageState extends State<PostFeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: BlocBuilder<PostFeedBloc, PostFeedState>(
            builder: (context, state) {
              return switch (state) {
                PostFeedLoadInProgress() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                PostFeedLoadFailure() => Text(state.error),
                PostFeedLoadSuccess() => ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            state.posts[index].userImage,
                          ),
                        ),
                        title: Text(
                          'New Post from ${state.posts[index].username}',
                        ),
                        subtitle: Text(
                          state.posts[index].content,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostDetailPage(
                                post: state.posts[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
