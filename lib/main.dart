import 'package:besquare_chat_room/sign_in/sign_in.dart';
import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(title: 'Sign In'),
    );
  }
}
