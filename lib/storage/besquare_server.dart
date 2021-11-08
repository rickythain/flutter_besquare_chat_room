import 'dart:async';
import 'dart:convert';

import 'package:besquare_chat_room/create_post/create_post_cubit.dart';
import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_event.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final channel = IOWebSocketChannel.connect('ws://besquare-demo.herokuapp.com');
late List<Post> posts;
StreamController<List<Post>> postsController = StreamController<List<Post>>();
Stream<List<Post>> postsStream = postsController.stream;

besquareServer() async {
  channel.stream.listen((message) {
    print(message);
    var data = jsonDecode(message);
    // print(data['data']['posts']);

    if (data['type'] == 'all_posts') {
      List<Post> resultPosts;
      resultPosts = ApiResultPosts.fromJson(data['data']).posts!;
      postsController.add(resultPosts);
    }
  });
}

@override
void dispose() {
  channel.sink.close();
}

signInUser(var username) {
  channel.sink.add('{"type": "sign_in","data": {"name": "$username"}}');
  getAllPosts();
}

getAllPosts() {
  channel.sink.add('{"type": "get_posts"}');
}

createNewPost(NewPost post) {
  channel.sink.add(
      '{"type": "create_post","data": {"title": "${post.title}","description": "${post.description}","image": "${post.image}"}}');
}

deletePost(String postId) {
  channel.sink.add('{"type": "delete_post","data": {"postId": "$postId"}}');
}
