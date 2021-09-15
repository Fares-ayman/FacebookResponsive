import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/post_bottom.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:facebook/presentation/widget/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'carousel_dots_widget.dart';

class PostContainer extends StatelessWidget {
  final PostEntity post;
  final UserEntity user;
  final List<UserEntity> users;

  const PostContainer({
    Key? key,
    required this.post,
    required this.user,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1.0 : 0.0,
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 5.0 : 0.0, vertical: 5.0),
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _postHeader(),
                    SizedBox(
                      height: 18.0,
                    ),
                    Text(post.caption),
                    post.imageUrl == null
                        ? SizedBox.shrink()
                        : SizedBox(
                            height: 6.0,
                          ),
                  ],
                ),
              ),
              post.imageUrl.length != 0
                  ? post.imageUrl.length > 1
                      ? CarouselWithDotsPage(
                          imgList: post.imageUrl,
                        )
                      : Image.network(
                          "${post.imageUrl[0]}",
                        )
                  : SizedBox.shrink(),
              postBottom(
                post: post,
                users: users,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postHeader() {
    return Row(
      children: [
        ProfileAvatar(imageUrl: user.imageUrl),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} • ",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => print("More"),
          icon: Icon(
            Icons.more_horiz,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
