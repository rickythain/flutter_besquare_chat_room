import 'package:besquare_chat_room/create_post/create_post_cubit.dart';
import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _cubitCreatePost = CreatePost();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Text('Create a new post'),
                TextField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your title'),
                  onChanged: (text) {
                    _cubitCreatePost.titleChange(text);
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your image'),
                  onChanged: (text) {
                    _cubitCreatePost.imageChange(text);
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your description'),
                  onChanged: (text) {
                    _cubitCreatePost.descriptionChange(text);
                  },
                ),
                ElevatedButton(
                  child: const Text('enter'),
                  onPressed: () {
                    _cubitCreatePost.createPost();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
