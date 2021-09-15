part of 'story_cubit.dart';

abstract class StoryState {
  const StoryState();
}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryLoaded extends StoryState {
  final List<StoryEntity> stories;

  StoryLoaded(this.stories);
}

class StoryFailure extends StoryState {}
