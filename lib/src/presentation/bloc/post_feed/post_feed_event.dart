part of 'post_feed_bloc.dart';

sealed class PostFeedEvent extends Equatable {
  const PostFeedEvent();

  @override
  List<Object> get props => [];
}

class PostFeedLRequested extends PostFeedEvent {
  const PostFeedLRequested();

  @override
  List<Object> get props => [];
}
