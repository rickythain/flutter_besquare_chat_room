import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final channel = IOWebSocketChannel.connect('ws://besquare-demo.herokuapp.com');

besquareServer() async {
  channel.stream.listen((message) {
    print(message);
  });
}

@override
void dispose() {
  channel.sink.close();
}

signInUser(var username) {
  channel.sink.add('{"type": "sign_in","data": {"name": "$username"}}');
}
