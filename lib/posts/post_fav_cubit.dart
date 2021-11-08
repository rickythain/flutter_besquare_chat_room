import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavPost extends Cubit<bool> {
  FavPost() : super(false);

  void initializeFav(bool favStatus) {
    emit(favStatus);
  }

  void changeFav(bool favStatus, Post post) {
    post.setFav(favStatus);
    emit(favStatus);
  }
}
