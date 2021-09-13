import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:facebook/presentation/widget/responsive.dart';
import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'carousel_dots_widget.dart';

class PostContainer extends StatelessWidget {
  final PostEntity post;
  final UserEntity user;
  final List<String> images;
  const PostContainer({Key? key, required this.post, required this.user,required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop=Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop?1.0:0.0,
      margin: EdgeInsets.symmetric(horizontal: isDesktop?5.0:0.0,vertical: 5.0),
      shape: isDesktop?RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)):null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child:  Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _postHeader(
                      post: post,
                      user: user,
                    ),
                    SizedBox(height: 0.5,),
                    Text(post.caption),
                    post.imageUrl==null?SizedBox.shrink():SizedBox(height: 6.0,),

                  ],
                ),
              ),
              post.imageUrl!=null?images.length>1?CarouselWithDotsPage(imgList: images,):Image.network("${post.imageUrl}",):SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                child: _postStats(post:post),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _postHeader extends StatelessWidget {
  final PostEntity post;
  final UserEntity user;
  const _postHeader({Key? key, required this.post, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(Icons.more_horiz,color: Colors.grey[600],),
        ),
      ],
    );
  }
}

class _postStats extends StatelessWidget {
  final PostEntity post;
  const _postStats({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.thumb_up,size: 10.0,color: Colors.white,),
            ),
            SizedBox(width: 4.0,),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(
                  color: Colors.grey[600]
                ),
              ),
            ),
            Text(
              "${post.comments} Comments",
              style: TextStyle(
                  color: Colors.grey[600]
              ),
            ),
            SizedBox(width: 8.0,),
            Text(
              "${post.shares} Shares",
              style: TextStyle(
                  color: Colors.grey[600]
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            _postButton(
              icon:Icon(MdiIcons.thumbUpOutline,color: Colors.grey[600],size: 20.0,),
              lable:"Like",
              onTab:()=>print("Like")
            ),
            _postButton(
                icon:Icon(MdiIcons.commentOutline,color: Colors.grey[600],size: 20.0,),
                lable:"Comment",
                onTab:()=>print("Comment")
            ),
            _postButton(
                icon:Icon(MdiIcons.shareOutline,color: Colors.grey[600],size: 25.0,),
                lable:"Share",
                onTab:()=>print("Share")
            ),
          ],
        ),
      ],
    );
  }
}

class _postButton extends StatelessWidget {
  final Icon icon;
  final String lable;
  final VoidCallback onTab;
  const _postButton({Key? key,required this.icon,required this.lable,required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTab,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 5.0,),
                Text(lable,style: TextStyle(color: Colors.grey[600]),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
