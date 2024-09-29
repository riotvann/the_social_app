import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/src/core/errors/failures.dart';
import 'package:social_app/src/core/usecase.dart';
import 'package:social_app/src/domain/entities/post.dart';
import 'package:social_app/src/domain/usecases/get_posts_usecase.dart';

part 'post_feed_event.dart';
part 'post_feed_state.dart';

class PostFeedBloc extends Bloc<PostFeedEvent, PostFeedState> {
  final GetPostsUsecase _getPostFeedList;

  PostFeedBloc(this._getPostFeedList) : super(const PostFeedLoadInProgress()) {
    on<PostFeedLRequested>(_load);
  }

  Future _load(PostFeedLRequested event, Emitter emit) async {
    emit(const PostFeedLoadInProgress());

    final postsEither = await _getPostFeedList.call();

    postsEither.fold(
      (failure) => emit(PostFeedLoadFailure(error: failure.message)),
      (posts) => emit(PostFeedLoadSuccess(posts: posts)),
    );
  }
}
