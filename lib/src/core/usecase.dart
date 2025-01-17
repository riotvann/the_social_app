import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:social_app/src/core/errors/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
