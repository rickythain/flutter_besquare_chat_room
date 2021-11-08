import 'package:besquare_chat_room/posts/posts_bloc/post_bloc.dart';
import 'package:besquare_chat_room/posts/posts_bloc/post_state.dart';
import 'package:besquare_chat_room/sign_in/sign_in.dart';
import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  besquareServer();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Besquare Chat Room',
      theme: ThemeData(
          primaryColor: Colors.red.shade300,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 28.0),
            bodyText1: TextStyle(
                fontSize: 16.0, fontFamily: 'Hind', color: Colors.grey),
            bodyText2: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Hind',
                fontStyle: FontStyle.italic),
          )),
      home: SignInPage(title: 'Sign In'),
    );
  }
}
