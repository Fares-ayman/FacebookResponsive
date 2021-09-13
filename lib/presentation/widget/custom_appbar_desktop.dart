import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/circle_button.dart';
import 'package:facebook/presentation/widget/custom_appbar_mobile.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppbarDesktop extends StatelessWidget {
  final TabController controller;
  final List<IconData> icons;
  final int selectedIndex;
  // final Function(int) onTap;
  final UserEntity currentUser;
  const CustomAppbarDesktop({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    //required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    child: Icon(
                  Icons.facebook,
                  size: 50.0,
                  color: Palette.facebookBlue,
                )),
                SizedBox(
                  width: 6.0,
                ),
                Flexible(
                  child: Container(
                    width: 250.0,
                    height: 45.0,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                          hintText: "Search Facebook",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomAppbarMobile(
              icons: icons,
              selectedIndex: selectedIndex,
              //onTap: onTap,
              controller: controller,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => print("User Card"),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileAvatar(imageUrl: currentUser.imageUrl),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "${currentUser.name}",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Flexible(
                    child: CircleButton(
                        icon: MdiIcons.facebookMessenger,
                        iconSize: 30.0,
                        onPressed: () => print("Messanger"))),
                Flexible(
                    child: CircleButton(
                        icon: Icons.notifications,
                        iconSize: 30.0,
                        onPressed: () => print("Notifications"))),
                Flexible(
                    child: CircleButton(
                        icon: Icons.arrow_drop_down,
                        iconSize: 30.0,
                        onPressed: () => print("Arrow Drop Down"))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
