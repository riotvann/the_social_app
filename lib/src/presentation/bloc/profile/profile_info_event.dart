part of 'profile_info_bloc.dart';

sealed class ProfileInfoEvent extends Equatable {
  const ProfileInfoEvent();
}

class ProfileInfoRequested extends ProfileInfoEvent {
  const ProfileInfoRequested();

  @override
  List<Object?> get props => [];
}
