import 'package:animated_text_kit/animated_text_kit.dart';
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
  final List<IconData> icons;
  final int selectedIndex;
  final UserEntity currentUser;
  final List<UserEntity> users;
  final List<PostEntity> posts;

  const AppbarWidget({
    Key? key,
    required this.selectedIndex,
    required this.controller,
    required this.currentUser,
    required this.icons,
    required this.users,
    required this.posts,
  }) : super(key: key);

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScroll) => [
        !Responsive.isDesktop(context)
            ? CallMobileAppbar(
                controller: widget.controller,
                selectedIndex: widget.selectedIndex,
                icons: widget.icons,
              )
            : CallDesktopAppbar(
                icons: widget.icons,
                selectedIndex: widget.selectedIndex,
                controller: widget.controller,
                currentUser: widget.currentUser),
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

class CallMobileAppbar extends StatelessWidget {
  final TabController controller;
  final List<IconData> icons;
  final int selectedIndex;

  const CallMobileAppbar(
      {Key? key,
      required this.selectedIndex,
      required this.icons,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: DefaultTextStyle(
        style: const TextStyle(
          color: Palette.facebookBlue,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            WavyAnimatedText('facebook'),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
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
          icons: icons,
          selectedIndex: selectedIndex,
          controller: controller,
          //onTap: (index) => setState(() => _selectedIndex = index)
        ),
      ),
    );
  }
}

class CallDesktopAppbar extends StatelessWidget {
  final TabController controller;
  final List<IconData> icons;
  final int selectedIndex;
  final UserEntity currentUser;

  const CallDesktopAppbar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.controller,
      required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: Size(screenSize.width, 9),
        child: CustomAppbarDesktop(
          currentUser: currentUser,
          icons: icons,
          selectedIndex: selectedIndex,
          controller: controller,
        ),
      ),
    );
  }
}
