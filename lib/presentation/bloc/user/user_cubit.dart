import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/domain/usecases/get_all_users_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsersUsecase getAllUsersUsecase;

  UserCubit({required this.getAllUsersUsecase}) : super(UserInitial());

  Future<void> getAllUsers() async {
    emit(UserLoading());
    try {
      final userData = await getAllUsersUsecase.call();
      emit(UserLoaded(userData));
    } catch (_) {
      emit(UserFailure());
    }
  }
}
