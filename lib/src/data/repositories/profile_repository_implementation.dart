import 'package:fpdart/src/either.dart';
import 'package:social_app/src/core/errors/exceptions.dart';
import 'package:social_app/src/core/errors/failures.dart';
import 'package:social_app/src/data/datasources/profile_info_remote_datasource.dart';
import 'package:social_app/src/domain/entities/user.dart';
import 'package:social_app/src/domain/repositories/profile_info_repository.dart';

class ProfileInfoRepositoryImplementation implements ProfileInfoRepository {
  const ProfileInfoRepositoryImplementation({
    required ProfileInfoRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final ProfileInfoRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, User>> getInfo() async {
    try {
      final result = await _remoteDataSource.getInfo();
      return right(result);
    } on APIException catch (e) {
      return left(APIFailure.fromException(e));
    }
  }
}
