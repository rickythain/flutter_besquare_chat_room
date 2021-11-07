import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:besquare_chat_room/posts/post_item.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_bloc.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_event.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_state.dart';
import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late PostBloc postBloc;
  List<Post>? allPosts = [];

  @override
  void initState() {
    super.initState();

    postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts page'),
      ),
      body: SafeArea(
          child: Container(
        child: StreamBuilder<List<Post>>(
            stream: postsStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasError) {
                return Text('error found');
              }

              if (!snapshot.hasData) {
                return Text('loading data');
              }

              allPosts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return PostItem(post: allPosts![index]);
                },
                itemCount: 9,
              );
            }),
      )),
    );
  }
}
