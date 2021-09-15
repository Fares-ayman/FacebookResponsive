import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class postBottom extends StatefulWidget {
  final PostEntity post;
  final List<UserEntity> users;

  const postBottom({Key? key, required this.post, required this.users})
      : super(key: key);

  @override
  _postBottomState createState() => _postBottomState();
}

class _postBottomState extends State<postBottom> {
  bool isSendIcon = false;
  int commentCount = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.post.commentsText.length == 0
          ? 160
          : widget.post.commentsText.length > 1
              ? 300.0
              : 250.0,
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          _postStats(),
          Expanded(
            child: ListView.builder(
              itemCount: widget.post.commentsText.length,
              itemBuilder: (context, index) {
                String commentText = widget.post.commentsText[index];
                UserEntity userOfComment = _findUserOfComment(
                    widget.users, widget.post.usersOfComments[index]);
                return _createComment(
                    commentText: commentText, userOfComment: userOfComment);
              },
            ),
          ),
          _createNewComment(),
        ],
      ),
    );
  }

  Widget _postStats() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                "${widget.post.likes}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              "${widget.post.comments + commentCount} Comments",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "${widget.post.shares} Shares",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            _postButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                lable: "Like",
                onTab: () => print("Like")),
            _postButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                lable: "Comment",
                onTab: () => print("Comment")),
            _postButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 25.0,
                ),
                lable: "Share",
                onTab: () => print("Share")),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _createNewComment() {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: Row(
        children: [
          ProfileAvatar(
            imageUrl: widget.users[0].imageUrl,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[200],
              ),
              height: 40.0,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (val) {
                        setState(() {
                          if (val == "") {
                            isSendIcon = false;
                          } else {
                            isSendIcon = true;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                        hintText: "Write a comment.....",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  isSendIcon == false
                      ? Row(
                          children: [
                            Icon(Icons.camera_alt),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(MdiIcons.sticker),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(Icons.emoji_emotions_outlined),
                            SizedBox(
                              width: 5.0,
                            ),
                          ],
                        )
                      : Material(
                          color: Colors.grey[200],
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.post.commentsText
                                    .add(textEditingController.text);
                                widget.post.usersOfComments
                                    .add(widget.users[0].name);
                                commentCount++;
                                textEditingController.clear();
                                isSendIcon = false;
                              });
                            },
                            child: Icon(
                              Icons.send,
                              size: 20.0,
                              color: Palette.facebookBlue,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  UserEntity _findUserOfComment(List<UserEntity> users, String userName) {
    int i = 0;
    for (; i < users.length; i++) {
      if (users[i].name == userName) break;
    }
    return users[i];
  }
}

class _createComment extends StatelessWidget {
  final String commentText;
  final UserEntity userOfComment;

  const _createComment({
    Key? key,
    required this.commentText,
    required this.userOfComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAvatar(imageUrl: userOfComment.imageUrl),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userOfComment.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(commentText),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 13.0),
                  child: Row(
                    children: [
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () => print("Like"),
                          child: Text(
                            "Like",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () => print("Reply"),
                          child: Text(
                            "Reply",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _postButton extends StatelessWidget {
  final Icon icon;
  final String lable;
  final VoidCallback onTab;

  const _postButton(
      {Key? key, required this.icon, required this.lable, required this.onTab})
      : super(key: key);

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
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  lable,
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
