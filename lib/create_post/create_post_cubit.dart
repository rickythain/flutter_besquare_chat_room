import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePost extends Cubit<NewPost> {
  CreatePost() : super(NewPost('', '', ''));
  String? title;
  String? description;
  String? image;
  NewPost? post;

  void titleChange(text) => title = text;
  void descriptionChange(text) => description = text;
  void imageChange(text) => image = text;

  void createPost() {
    print('data: $title, $description, $image');
    post = NewPost(title, description, image);

    createNewPost(post!);
  }
}

class NewPost {
  String? title;
  String? description;
  String? image;

  NewPost(this.title, this.description, this.image);
}
