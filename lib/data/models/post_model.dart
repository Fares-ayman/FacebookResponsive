import 'package:facebook/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required String userName,
    required String caption,
    required String timeAgo,
    String? imageUrl,
    required int likes,
    required int comments,
    required int shares,
  }) : super(
          userName: userName,
          caption: caption,
          timeAgo: timeAgo,
          imageUrl: imageUrl,
          likes: likes,
          comments: comments,
          shares: shares,
        );

  factory PostModel.fromjson(Map<String, dynamic> snapshot) {
    return PostModel(
        userName: snapshot['user'],
        caption: snapshot['caption'],
        timeAgo: snapshot['timeAgo'],
        imageUrl: snapshot['imageUrl'],
        likes: snapshot['likes'],
        comments: snapshot['comments'],
        shares: snapshot['shares']
    );
  }
}
