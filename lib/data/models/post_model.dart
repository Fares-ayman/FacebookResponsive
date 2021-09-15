import 'package:facebook/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required String userName,
    required String caption,
    required String timeAgo,
    required List<dynamic> imageUrl,
    required int likes,
    required int comments,
    required int shares,
    required List<dynamic> commentsText,
    required List<dynamic> usersOfComments,
  }) : super(
            userName: userName,
            caption: caption,
            timeAgo: timeAgo,
            imageUrl: imageUrl,
            likes: likes,
            comments: comments,
            shares: shares,
            commentsText: commentsText,
            usersOfComments: usersOfComments);

  factory PostModel.fromjson(Map<String, dynamic> snapshot) {
    List<dynamic> makeList = [];
    if (snapshot['imageUrl'] is String) makeList.add(snapshot['imageUrl']);

    return PostModel(
        userName: snapshot['user'],
        caption: snapshot['caption'],
        timeAgo: snapshot['timeAgo'],
        imageUrl:
            snapshot['imageUrl'] is String ? makeList : snapshot['imageUrl'],
        likes: snapshot['likes'],
        comments: snapshot['comments'],
        shares: snapshot['shares'],
        commentsText: snapshot['commentsText'],
        usersOfComments: snapshot['usersOfComments']);
  }
}
