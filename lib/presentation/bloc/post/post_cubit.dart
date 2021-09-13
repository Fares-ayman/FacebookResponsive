import 'dart:io';

import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/usecases/get_all_posts_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState>{

  final GetAllPostsUsecase getAllPostsUsecase;

  PostCubit({required this.getAllPostsUsecase}) : super(PostInitial());

  Future<void>getAllPosts()async{
    emit(PostLoading());
    try{
      final postData=await getAllPostsUsecase.call();
      emit(PostLoaded(postData));
    }on SocketException catch(_)
    {
      emit(PostFailure());
    }
    catch(_){
      emit(PostFailure());
    }
  }
}