import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/src/core/usecase.dart';
import 'package:social_app/src/domain/entities/user.dart';
import 'package:social_app/src/domain/usecases/get_profile_info_usecase.dart';
import 'package:social_app/src/presentation/bloc/post_feed/post_feed_bloc.dart';

part 'profile_info_event.dart';
part 'profile_info_state.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  final GetProfileInfoUsecase _getProfileInfo;

  ProfileInfoBloc(this._getProfileInfo)
      : super(const ProfileInfoLoadInProgress()) {
    on<ProfileInfoRequested>(_getInfo);
  }

  Future _getInfo(ProfileInfoRequested event, Emitter emit) async {
    emit(const ProfileInfoLoadInProgress());

    final userEither = await _getProfileInfo.call();

    userEither.fold(
      (failure) => emit(ProfileInfoLoadFailure(failure.message)),
      (user) => emit(ProfileInfoLoadSuccess(user: user)),
    );
  }
}
