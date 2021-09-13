import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:facebook/presentation/widget/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final UserEntity currentUser;
  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop=Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop?1.0:0.0,
      margin: EdgeInsets.symmetric(horizontal: isDesktop?5.0:0.0),
      shape: isDesktop?RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)):null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(
                    imageUrl: currentUser.imageUrl,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 35.0,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                            hintText: "what\'s on your mind?",
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40.0)))
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 10.0,
                thickness: 0.5,
              ),
              Container(
                height: 35.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => print("Live"),
                      child:Row(
                        children: [
                          Icon(Icons.videocam,color: Colors.red,),
                          SizedBox(width: 7,),
                          Text("Live",style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    VerticalDivider(width: 0.8,),
                    TextButton(
                      onPressed: () => print("Photo"),
                      child:Row(
                        children: [
                          Icon(Icons.photo_library,color: Colors.green,),
                          SizedBox(width: 7,),
                          Text("Photo",style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    VerticalDivider(width: 0.8,),
                    TextButton(
                      onPressed: () => print("Room"),
                      child:isDesktop?Row(
                        children: [
                          Icon(Icons.tag_faces,color: Colors.yellow,),
                          SizedBox(width: 7,),
                          Text("Feeling/Activity",style: TextStyle(color: Colors.black),)
                        ],
                      ): Row(
                        children: [
                          Icon(Icons.video_call,color: Colors.purpleAccent,),
                          SizedBox(width: 7,),
                          Text("Room",style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
