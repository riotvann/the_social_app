import 'package:fpdart/src/either.dart';
import 'package:social_app/src/core/errors/failures.dart';
import 'package:social_app/src/core/usecase.dart';
import 'package:social_app/src/domain/entities/post.dart';
import 'package:social_app/src/domain/repositories/post_feed_repository.dart';

class GetPostsUsecase {
  final PostFeedRepository _repository;

  const GetPostsUsecase({
    required PostFeedRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<Post>>> call() async {
    return await _repository.getAll();
  }
}
