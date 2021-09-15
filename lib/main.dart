import 'package:facebook/data/local_datasource/local_datasource.dart';
import 'package:facebook/data/local_datasource/local_datasource_impl.dart';
import 'package:facebook/data/repositories/local_data_repository_impl.dart';
import 'package:facebook/domain/repositories/local_data_repository.dart';
import 'package:facebook/domain/usecases/get_all_stories_usecase.dart';
import 'package:facebook/domain/usecases/get_all_users_usecase.dart';
import 'package:facebook/presentation/bloc/post/post_cubit.dart';
import 'package:facebook/presentation/bloc/story/story_cubit.dart';
import 'package:facebook/presentation/bloc/user/user_cubit.dart';
import 'package:facebook/presentation/screens/navigation_screen.dart';
import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/usecases/get_all_posts_usecase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalDataSource localDataSource = LocalDataSourceImpl();
    LocalDataRepository localDataRepository =
        LocalDataRepositoryImpl(localDataSource: localDataSource);

    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (_) {
            GetAllUsersUsecase getAllUsersUsecase =
                GetAllUsersUsecase(localDataRepository: localDataRepository);
            return UserCubit(getAllUsersUsecase: getAllUsersUsecase);
          },
        ),
        BlocProvider<StoryCubit>(
          create: (_) {
            GetAllStoriesUsecase getAllStoriesUsecase =
                GetAllStoriesUsecase(localDataRepository: localDataRepository);
            return StoryCubit(getAllStoriesUsecase: getAllStoriesUsecase);
          },
        ),
        BlocProvider<PostCubit>(
          create: (_) {
            GetAllPostsUsecase getAllPostsUsecase =
                GetAllPostsUsecase(localDataRepository: localDataRepository);
            return PostCubit(getAllPostsUsecase: getAllPostsUsecase);
          },
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Palette.scaffold),
        debugShowCheckedModeBanner: false,
        home: NavigationScreen(),
      ),
    );
  }
}
