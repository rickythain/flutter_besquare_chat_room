import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {}

class PostInitialState extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadedState extends PostState {
  List<Post> posts;

  PostLoadedState({required this.posts});

  @override
  List<Object> get props => [posts];
}

class PostErrorState extends PostState {
  String message;

  PostErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
