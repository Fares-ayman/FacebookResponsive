import 'package:facebook/domain/entities/story_entity.dart';

class StoryModel extends StoryEntity {
  StoryModel({
    required String userName,
    required String imageUrl,
    required bool isViewed,
  }) : super(
    userName:userName,
    imageUrl:imageUrl,
    isViewed:isViewed,
        );

  factory StoryModel.fromjson(Map<String, dynamic> snapshot) {
    return StoryModel(
      userName: snapshot['user'],
      imageUrl: snapshot['imageUrl'],
      isViewed: snapshot['isViewed']
    );
  }
}
