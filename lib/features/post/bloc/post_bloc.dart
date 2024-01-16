import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:bloc_study_with_api/features/post/models/post_data_ui_model.dart';
import 'package:meta/meta.dart';

import '../repos/post_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitalFetchEvent>(postInitalFetchEvent);
    on<PostsAddEvent>(postsAddEvent);
  }

  FutureOr<void> postInitalFetchEvent(
      PostInitalFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostDataUiModel> posts = await PostsRepo.fetchPosts();

    emit(PostFetchingSuccessFulSate(posts: posts));
  }

  FutureOr<void> postsAddEvent(
      PostsAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostsRepo.addPosts();
    print(success);
    if (success) {
      emit(PostAddSuccesState());
      
    } else {
      emit(PostAddErrorState());
    }
  }
}
