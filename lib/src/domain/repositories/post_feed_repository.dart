import 'package:fpdart/fpdart.dart';
import 'package:social_app/src/core/errors/failures.dart';
import 'package:social_app/src/domain/entities/post.dart';

abstract class PostFeedRepository {
  Future<Either<Failure, List<Post>>> getAll();
}
