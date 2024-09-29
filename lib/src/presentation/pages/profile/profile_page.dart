import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/src/presentation/bloc/profile/profile_info_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
            builder: (context, state) {
              return switch (state) {
                ProfileInfoLoadInProgress() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ProfileInfoLoadFailure() => Text(state.error),
                ProfileInfoLoadSuccess() => Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          state.user.profilePicture,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.user.username,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.user.bio,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
