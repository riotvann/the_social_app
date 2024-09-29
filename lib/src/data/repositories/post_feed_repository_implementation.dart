import 'package:fpdart/src/either.dart';
import 'package:social_app/src/core/errors/exceptions.dart';
import 'package:social_app/src/core/errors/failures.dart';
import 'package:social_app/src/data/datasources/post_remote_datasource.dart';
import 'package:social_app/src/domain/entities/post.dart';
import 'package:social_app/src/domain/repositories/post_feed_repository.dart';

class PostFeedRepositoryImplementation implements PostFeedRepository {
  const PostFeedRepositoryImplementation({
    required PostRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final PostRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Post>>> getAll() async {
    try {
      final result = await _remoteDataSource.getAll();
      return right(result);
    } on APIException catch (e) {
      return left(APIFailure.fromException(e));
    }
  }
}
