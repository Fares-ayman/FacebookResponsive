import 'package:facebook/data/local_datasource/local_datasource.dart';
import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/story_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/domain/repositories/local_data_repository.dart';

class LocalDataRepositoryImpl extends LocalDataRepository {
  final LocalDataSource localDataSource;

  LocalDataRepositoryImpl({required this.localDataSource});

  @override
  Future<List<UserEntity>> getAllUsers() async =>
      await localDataSource.getAllUsers();

  @override
  Future<List<StoryEntity>> getAllStories() async =>
      await localDataSource.getAllStories();

  @override
  Future<List<PostEntity>> getAllposts() async =>
      await localDataSource.getAllposts();
}
