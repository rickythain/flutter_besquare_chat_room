import 'package:besquare_chat_room/create_post/create_post.dart';
import 'package:besquare_chat_room/create_post/image_preview_cubit.dart';
import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:besquare_chat_room/posts/post_fav_cubit.dart';
import 'package:besquare_chat_room/posts/post_item.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_bloc.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_event.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_state.dart';
import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  final author;
  PostsPage({Key? key, required this.author}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late PostBloc postBloc;
  List<Post>? allPosts = [];

  var _listCap = 5;
  var _listViewController = ScrollController();

  @override
  void initState() {
    super.initState();

    postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FetchPostsEvent());

    _listViewController.addListener(() {
      if (_listViewController.position.atEdge) {
        if (_listViewController.position.pixels == 0) {
        } else {
          setState(() {
            _listCap += 10;
          });
          // print("reach end " + _listCap.toString());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'create a post',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider(
                          create: (context) => ImagePreview(),
                          child: CreatePostPage(),
                        )),
              );
            },
          )
        ],
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
                return Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ));
              }

              allPosts = snapshot.data;
              allPosts = List.from(allPosts!.reversed);

              return ListView.builder(
                itemBuilder: (context, index) {
                  return BlocProvider(
                    create: (_) => FavPost(),
                    child: PostItem(
                      post: allPosts![index],
                      author: widget.author,
                    ),
                  );
                },
                itemCount: _listCap,
                controller: _listViewController,
              );
            }),
      )),
    );
  }
}
