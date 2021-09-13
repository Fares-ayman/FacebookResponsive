import 'package:facebook/domain/entities/story_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:facebook/presentation/widget/responsive.dart';
import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final List<UserEntity> users;
  final List<StoryEntity> stories;
  const Stories({Key? key, required this.users, required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Responsive.isDesktop(context)?Colors.transparent:Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex:2,
                          child: Image.network(
                            users[0].imageUrl,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 100.0,
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: Palette.storyGradient,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: Responsive.isDesktop(context)?[BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0,2),
                          blurRadius: 4.0
                      ),]:null,
                    ),
                  ),
                  Positioned(
                    bottom: 40.0,
                    right: 30.0,
                    child:CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 20.0,
                      child: CircleAvatar(
                        radius: 18.0,
                        backgroundColor: Palette.facebookBlue,
                        child: Icon(Icons.add,color: Colors.grey[100],),
                      ),
                    ) ,
                  ),
                  Positioned(
                    bottom: 7.0,
                    right: 20.0,
                    child: Text("Create Story",style: TextStyle(fontSize: 12.0,letterSpacing: -0.3,fontWeight: FontWeight.w500,color:Colors.white),),
                  )
                ],
              ),
            );
          }
          final StoryEntity story = stories[index - 1];
          final UserEntity user=users[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story,user: user,),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final StoryEntity story;
  final UserEntity user;
  const _StoryCard({Key? key, required this.story,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            story.imageUrl,
            height: double.infinity,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 100.0,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.isDesktop(context)?[BoxShadow(
              color: Colors.black26,
              offset: Offset(0,2),
              blurRadius: 4.0
            ),]:null,
          ),
        ),
        Positioned(
          top: 0.8,
          left: 0.8,
          child: ProfileAvatar(imageUrl: user.imageUrl,hasBorder: !story.isViewed,),
        ),
        Positioned(
          bottom: 10.0,
          left: 10.0,
          right: 10.0,
          child: Text(story.userName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
          maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
