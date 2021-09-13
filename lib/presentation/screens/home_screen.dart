import 'dart:async';
import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/pages/home_desktop_page.dart';
import 'package:facebook/presentation/pages/home_mobile_page.dart';
import 'package:facebook/presentation/widget/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:facebook/presentation/bloc/story/story_cubit.dart';

class HomeScreen extends StatefulWidget {
  final List<UserEntity>users;
  final List<PostEntity>posts;
  const HomeScreen({Key? key,required this.users,required this.posts}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with AutomaticKeepAliveClientMixin<HomeScreen>{

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      BlocProvider.of<StoryCubit>(context).getAllStories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        body:BlocBuilder<StoryCubit, StoryState>(
          builder: (context, storyState) {
        if (storyState is StoryLoaded) {
          return Responsive(
            mobile: HomeMobilePage(
              posts: widget.posts,
              users: widget.users,
              stories: storyState.stories,
               // trackingScrollController: _trackingScrollController,
            ),
            desktop: HomeDesktopPage(
              posts: widget.posts,
              users: widget.users,
              stories: storyState.stories,
               // trackingScrollController: _trackingScrollController,
            ),
          );
        }
        return Container();
          },
        )
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
