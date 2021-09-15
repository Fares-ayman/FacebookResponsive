import 'package:facebook/domain/entities/story_entity.dart';
import 'package:facebook/domain/usecases/get_all_stories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  final GetAllStoriesUsecase getAllStoriesUsecase;

  StoryCubit({required this.getAllStoriesUsecase}) : super(StoryInitial());

  Future<void> getAllStories() async {
    emit(StoryLoading());
    try {
      final storyData = await getAllStoriesUsecase.call();
      emit(StoryLoaded(storyData));
    } catch (_) {
      emit(StoryFailure());
    }
  }
}
