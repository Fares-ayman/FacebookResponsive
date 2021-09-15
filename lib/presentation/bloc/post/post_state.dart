part of 'post_cubit.dart';

abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostEntity> posts;

  PostLoaded(this.posts);
}

class PostFailure extends PostState {}
