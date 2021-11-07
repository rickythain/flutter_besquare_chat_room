import 'package:besquare_chat_room/posts/posts.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_bloc.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_state.dart';
import 'package:besquare_chat_room/sign_in/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _cubitSignIn = SignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Welcome to Besquare Chat Room'),
            TextField(
              decoration:
                  const InputDecoration(hintText: 'Enter your username'),
              onChanged: (text) {
                _cubitSignIn.textChanged(text);
              },
            ),
            ElevatedButton(
              child: const Text('enter'),
              onPressed: () {
                _cubitSignIn.signIn();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                            create: (context) => PostBloc(PostInitialState()),
                            child: const PostsPage(),
                          )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
