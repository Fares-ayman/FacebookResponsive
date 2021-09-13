

import 'package:facebook/domain/entities/story_entity.dart';
import 'package:facebook/domain/repositories/local_data_repository.dart';

class GetAllStoriesUsecase{
  final LocalDataRepository localDataRepository;

  GetAllStoriesUsecase({required this.localDataRepository});

  Future<List<StoryEntity>> call()async{
    return await localDataRepository.getAllStories();
  }
}