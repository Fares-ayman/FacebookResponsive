import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/material.dart';

class CustomAppbarMobile extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  // final Function(int) onTap;
  final TabController controller;
  const CustomAppbarMobile({
    Key? key,
    required this.icons,
    required this.selectedIndex,
   // required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorPadding: EdgeInsets.zero,
      indicatorColor: Palette.facebookBlue,
      indicatorWeight: 3.0,
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                ),
              ))
          .values
          .toList(),
      //onTap: onTap,
    );
  }
}
