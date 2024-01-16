part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class PostInitalFetchEvent extends PostEvent{}

class PostsAddEvent extends PostEvent{}