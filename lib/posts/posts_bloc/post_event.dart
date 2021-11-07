import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class FetchPostsEvent extends PostEvent {
  @override
  List<Object> get props => [];
}
