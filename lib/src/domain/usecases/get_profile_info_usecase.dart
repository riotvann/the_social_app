import 'package:fpdart/src/either.dart';
import 'package:social_app/src/core/errors/failures.dart';
import 'package:social_app/src/core/usecase.dart';
import 'package:social_app/src/domain/entities/user.dart';
import 'package:social_app/src/domain/repositories/profile_info_repository.dart';

class GetProfileInfoUsecase {
  final ProfileInfoRepository _repository;

  const GetProfileInfoUsecase({
    required ProfileInfoRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, User>> call() async {
    return await _repository.getInfo();
  }
}
