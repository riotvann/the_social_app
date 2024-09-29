part of 'post_feed_bloc.dart';

sealed class PostFeedState extends Equatable {
  const PostFeedState();

  @override
  List<Object> get props => [];
}

class PostFeedLoadInProgress extends PostFeedState {
  const PostFeedLoadInProgress();

  @override
  List<Object> get props => [];
}

class PostFeedLoadSuccess extends PostFeedState {
  final List<Post> posts;

  const PostFeedLoadSuccess({required this.posts});

  @override
  List<Object> get props => [posts];
}

class PostFeedLoadFailure extends PostFeedState {
  final String error;
  const PostFeedLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
}
