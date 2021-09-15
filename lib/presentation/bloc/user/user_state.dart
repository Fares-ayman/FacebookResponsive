part of 'user_cubit.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserEntity> users;

  UserLoaded(this.users);
}

class UserFailure extends UserState {}
