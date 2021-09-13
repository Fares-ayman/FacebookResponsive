import 'dart:async';
import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook/presentation/bloc/post/post_cubit.dart';
import 'package:facebook/presentation/bloc/user/user_cubit.dart';

import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with SingleTickerProviderStateMixin  {


  late TabController _controller;
  // late Size screenSize;
  late List<UserEntity> users;
  late List<PostEntity> posts;
  late UserEntity currentUser;

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      BlocProvider.of<UserCubit>(context).getAllUsers();
      BlocProvider.of<PostCubit>(context).getAllPosts();
    });
    _controller = TabController(vsync: this, length: _icons.length);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    }

  @override
  Widget build(BuildContext context) {
    // screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, userState) {
            if (userState is UserLoaded) {
              users = userState.users;
              currentUser = userState.users[0];
              return BlocBuilder<PostCubit, PostState>(
                builder: (context, postState) {
                  if (postState is PostLoaded) {
                    posts = postState.posts;
                    return AppbarWidget(selectedIndex: _selectedIndex, controller: _controller, currentUser: currentUser, icons: _icons, users: users, posts: posts);
                  }
                  return Container();
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
