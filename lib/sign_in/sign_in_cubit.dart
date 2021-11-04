import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends Cubit<String> {
  SignIn() : super('');

  void textChanged(text) => emit(text);

  void signIn() {
    // print('button pressed with username: $state');

    signInUser(state);
  }
}
