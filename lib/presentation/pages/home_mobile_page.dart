import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/story_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/create_post_container.dart';
import 'package:facebook/presentation/widget/post_container.dart';
import 'package:facebook/presentation/widget/rooms.dart';
import 'package:facebook/presentation/widget/stories.dart';
import 'package:flutter/material.dart';

class HomeMobilePage extends StatelessWidget {
  final List<UserEntity> users;
  final List<PostEntity> posts;
  final List<StoryEntity> stories;

  const HomeMobilePage({
    Key? key,
    required this.users,
    required this.posts,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
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
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              users: users,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final PostEntity post = posts[index];
              final UserEntity user = users[index];
              return PostContainer(
                post: post,
                user: user,
                users: users,
              );
            },
            childCount: posts.length,
          ),
        )
      ],
    );
  }
}
