import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/story_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/contacts_list.dart';
import 'package:facebook/presentation/widget/create_post_container.dart';
import 'package:facebook/presentation/widget/more_options_list.dart';
import 'package:facebook/presentation/widget/post_container.dart';
import 'package:facebook/presentation/widget/rooms.dart';
import 'package:facebook/presentation/widget/stories.dart';
import 'package:flutter/material.dart';

class HomeDesktopPage extends StatelessWidget {
  // final TrackingScrollController trackingScrollController;
  final List<UserEntity> users;
  final List<PostEntity> posts;
  final List<StoryEntity> stories;
  const HomeDesktopPage(
      {Key? key,
      required this.users,
      required this.posts,
      required this.stories,
       // required this.trackingScrollController,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser:users[0])
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
             // controller: trackingScrollController,
            scrollDirection: Axis.vertical,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    users: users,
                    stories:stories,
                  )
                  ,
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(
                  currentUser: users[0],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(
                    users: users.getRange(1, users.length).toList(),
                  ),
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final PostEntity post = posts[index];
                  final UserEntity user = users[index];
                  List<String> images = [];
                  if (post.imageUrl != null) images = post.imageUrl!.split(" ");
                  return PostContainer(
                    post: post,
                    user: user,
                    images: images,
                  );
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:EdgeInsets.all(12.0),
              child: ContactsList(users: users.getRange(1, users.length).toList(),),
            ),
          ),
        ),
      ],
    );
  }
}
