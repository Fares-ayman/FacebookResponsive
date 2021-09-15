import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/domain/repositories/local_data_repository.dart';

class GetAllUsersUsecase {
  final LocalDataRepository localDataRepository;

  GetAllUsersUsecase({required this.localDataRepository});

  Future<List<UserEntity>> call() async {
    return await localDataRepository.getAllUsers();
  }
}
