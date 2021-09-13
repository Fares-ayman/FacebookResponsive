

import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/story_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';

abstract class LocalDataSource{
  Future<List<UserEntity>> getAllUsers();
  Future<List<StoryEntity>> getAllStories();
  Future<List<PostEntity>> getAllposts();

}