import 'package:besquare_chat_room/create_post/create_post_cubit.dart';
import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_preview_cubit.dart';

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
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: BlocBuilder<ImagePreview, String>(
                      builder: (context, state) {
                        return Image.network(
                          state,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Center(child: Text('No image preview'));
                          },
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset.zero,
                              blurRadius: 5,
                              spreadRadius: 5)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
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
                      context.read<ImagePreview>().displayImage(text);
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        hintText: 'Enter your description'),
                    onChanged: (text) {
                      _cubitCreatePost.descriptionChange(text);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      child: const Text('enter'),
                      onPressed: () {
                        _cubitCreatePost.createPost();
                        getAllPosts();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
