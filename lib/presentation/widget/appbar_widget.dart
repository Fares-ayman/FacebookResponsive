import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/screens/home_screen.dart';
import 'package:facebook/presentation/widget/responsive.dart';
import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'circle_button.dart';
import 'custom_appbar_desktop.dart';
import 'custom_appbar_mobile.dart';


class AppbarWidget extends StatefulWidget {
  final TabController controller;
  final List<IconData>icons;
  final int selectedIndex;
  final UserEntity currentUser;
  final List<UserEntity> users;
  final List<PostEntity> posts;

  const AppbarWidget({Key? key,required this.selectedIndex,required this.controller,required this.currentUser,required this.icons,required this.users,required this.posts}) : super(key: key);

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScroll) => [
        !Responsive.isDesktop(context)
            ? SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          pinned: true,
          snap: true,
          floating: true,
          actions: [
            CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print("search")),
            CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () => print("Messenger")),
          ],
          bottom: PreferredSize(
            preferredSize: Size(screenSize.width, 49.0),
            child: CustomAppbarMobile(
              icons: widget.icons,
              selectedIndex: widget.selectedIndex,
              controller: widget.controller,
              //onTap: (index) => setState(() => _selectedIndex = index)
            ),
          ),
        )
            : SliverAppBar(
          pinned: true,
          snap: false,
          floating: false,
          bottom: PreferredSize(
            preferredSize: Size(screenSize.width, 9),
            child: CustomAppbarDesktop(
              currentUser: widget.currentUser,
              icons: widget.icons,
              selectedIndex: widget.selectedIndex,
              controller: widget.controller,
              //onTap: (index) => setState(() => _selectedIndex = index)
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: widget.controller,
        children: [
          HomeScreen(
            users: widget.users,
            posts: widget.posts,
          ),
          Scaffold(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
        ],
      ),
    );
  }
}
