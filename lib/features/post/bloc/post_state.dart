part of 'post_bloc.dart';

@immutable
sealed class PostState {}

abstract class PostActionState extends PostState {}

final class PostInitial extends PostState {}

class PostFetchingLoadingState extends PostState {}
class PostFetchingErrorState extends PostState {}

class PostFetchingSuccessFulSate extends PostState {
  final List<PostDataUiModel> posts;

  PostFetchingSuccessFulSate({required this.posts});
}

class PostAddSuccesState extends PostActionState{

  
}
class PostAddErrorState extends PostActionState{}
