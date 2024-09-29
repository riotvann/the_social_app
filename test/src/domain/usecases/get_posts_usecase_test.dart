import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_app/src/domain/entities/post.dart';
import 'package:social_app/src/domain/repositories/post_feed_repository.dart';
import 'package:social_app/src/domain/usecases/get_posts_usecase.dart';

import 'post_feed_repository.mock.dart';

void main() {
  late PostFeedRepository repository;
  late GetPostsUsecase usecase;

  setUp(() {
    repository = MockGetPostFeedRepo();
    usecase = GetPostsUsecase(repository: repository);
  });

  final tResponse = [Post.empty()];

  test(
    'should call [PostFeedRepo.getAll] and return [List<Post>]',
    () async {
      // Arange
      when(
        () => repository.getAll(),
      ).thenAnswer((_) async => right(tResponse));

      // Act
      final result = await usecase();

      expect(result, equals(right<dynamic, List<Post>>(tResponse)));

      verify(() => repository.getAll()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
