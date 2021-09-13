import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:facebook/presentation/widget/responsive.dart';
import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<UserEntity> users;
  const Rooms({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1.0 : 0.0,
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: !isDesktop?100.0:60.0,
          color: Colors.white,
          child: Column(
            children: [
              !isDesktop? Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Audio and video rooms",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ):SizedBox.shrink(),
              Expanded(
                child: ListView.builder(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return isDesktop?_createRoomButton():Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue[50]),
                          onPressed: () => print("Create Room"),
                          child: Text(
                            "Create Room",
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                        ),
                      );
                    }
                    final UserEntity user = users[index - 1];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProfileAvatar(
                        imageUrl: user.imageUrl,
                        isActive: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _createRoomButton extends StatelessWidget {
  const _createRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.lightBlueAccent,
          width: 1.0
        ),
      ),
      width: 130.0,
      child: Row(
        children: [
          SizedBox(width: 5.0),
          Icon(
            Icons.video_call,
            size: 30.0,
            color: Colors.purple,
          ),
           SizedBox(width: 5.0),
          TextButton(
            onPressed: () => print("Create Room"),
            child: Text(
              'Create Room',
              style: TextStyle(color: Palette.facebookBlue,fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
