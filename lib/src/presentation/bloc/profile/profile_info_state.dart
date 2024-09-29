part of 'profile_info_bloc.dart';

sealed class ProfileInfoState extends Equatable {
  const ProfileInfoState();
}

class ProfileInfoLoadInProgress extends ProfileInfoState {
  const ProfileInfoLoadInProgress();
  @override
  List<Object> get props => [];
}

class ProfileInfoLoadSuccess extends ProfileInfoState {
  final User user;

  const ProfileInfoLoadSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class ProfileInfoLoadFailure extends ProfileInfoState {
  final String error;

  const ProfileInfoLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
