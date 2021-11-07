import 'dart:async';
import 'dart:convert';

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
    // print(message);
    var data = jsonDecode(message);
    // print(data['data']['posts']);

    if (data['type'] == 'all_posts') {
      print("all posts is retrieved");
      // posts = getPosts(data['data']['posts']) as List<Post>;
      List<Post> resultPosts;
      resultPosts = ApiResultPosts.fromJson(data['data']).posts!;
      print("type of data-all posts: " + resultPosts.runtimeType.toString());
      // postsController.add(data['data']['posts']);
      postsController.add(resultPosts);

      dispose();
    }
  });
}

@override
void dispose() {
  channel.sink.close();
}

signInUser(var username) {
  channel.sink.add('{"type": "sign_in","data": {"name": "$username"}}');
  channel.sink.add('{"type": "get_posts"}');
}

Future<List<Post>?> getPosts(data) async {
  List<Post> resultPosts;
  resultPosts = ApiResultPosts.fromJson(data).posts!;
  return resultPosts;
}

Future<List<Post>> retrievePosts() async {
  return posts;
}

// Future<List<Post>> getAllPosts() async {
//   Future<List<Post>> postList;
//   StreamSubscription postsStreamSubscription = postsStream.listen((value) {
//     print('hi: $value');
//     postList = ApiResultPosts.fromJson(value).posts! as Future<List<Post>>;
//   });

//   return await postList;
// }
