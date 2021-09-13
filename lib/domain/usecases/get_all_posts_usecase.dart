import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/repositories/local_data_repository.dart';

class GetAllPostsUsecase{
  final LocalDataRepository localDataRepository;

  GetAllPostsUsecase({required this.localDataRepository});

  Future<List<PostEntity>> call()async{
    return await localDataRepository.getAllposts();
  }
}