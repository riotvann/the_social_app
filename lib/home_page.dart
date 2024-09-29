import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/src/data/datasources/post_remote_datasource.dart';
import 'package:social_app/src/data/datasources/profile_info_remote_datasource.dart';
import 'package:social_app/src/data/repositories/post_feed_repository_implementation.dart';
import 'package:social_app/src/data/repositories/profile_repository_implementation.dart';
import 'package:social_app/src/domain/repositories/post_feed_repository.dart';
import 'package:social_app/src/domain/usecases/get_posts_usecase.dart';
import 'package:social_app/src/domain/usecases/get_profile_info_usecase.dart';
import 'package:social_app/src/presentation/bloc/post_feed/post_feed_bloc.dart';
import 'package:social_app/src/presentation/bloc/profile/profile_info_bloc.dart';
import 'package:social_app/src/presentation/pages/post_feed/post_feed_page.dart';
import 'package:social_app/src/presentation/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: [
          BlocProvider(
            create: (_) {
              final repository = PostFeedRepositoryImplementation(
                remoteDataSource: PostRemoteDataSourceImpl(),
              );
              final getPostsUseCase = GetPostsUsecase(
                repository: repository,
              );
              return PostFeedBloc(getPostsUseCase)
                ..add(const PostFeedLRequested());
            },
            child: const PostFeedPage(),
          ),
          BlocProvider(
            create: (_) {
              final repository = ProfileInfoRepositoryImplementation(
                remoteDataSource: ProfileInfoRemoteDataSourceImpl(),
              );
              final getProfileInfoUseCase = GetProfileInfoUsecase(
                repository: repository,
              );
              return ProfileInfoBloc(getProfileInfoUseCase)
                ..add(const ProfileInfoRequested());
            },
            child: const ProfilePage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
