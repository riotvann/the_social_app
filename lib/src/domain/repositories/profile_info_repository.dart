import 'package:fpdart/fpdart.dart';
import 'package:social_app/src/core/errors/failures.dart';
import 'package:social_app/src/domain/entities/user.dart';

abstract class ProfileInfoRepository {
  Future<Either<Failure, User>> getInfo();
}
