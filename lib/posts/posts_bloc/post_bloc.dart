import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_event.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_state.dart';
import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(PostState initialState) : super(initialState);

  @override
  PostState get initialState => PostInitialState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPostsEvent) {
      print('in fetch');
      yield PostLoadingState();
      try {
        print('in try');
        List<Post> chatPosts = await retrievePosts();
        print("in fetch chatPosts: " + chatPosts.toString());
        yield PostLoadedState(posts: chatPosts);
      } catch (e) {
        print("in error " + e.toString());
        yield PostErrorState(message: e.toString());
      }
    }
  }
}
