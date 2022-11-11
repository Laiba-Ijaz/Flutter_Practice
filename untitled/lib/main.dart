import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'my_app.dart';
const apiKey = "67yunw38kkvb";
const userToken  = "j4cp3z4s4re5s5hzkcycqndugebpehp4k3zs4j96tch2eynrm4dfphgu53sbwcnq";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Stream chat Client
  final client= StreamChatClient(apiKey, logLevel: Level.INFO);

  //Current User
  await client.connectUser(User(id: "tutorial-flutter"), userToken);

  //Create Channel
  final channel = client.channel("messaging",id:"flutterdevs");
  await channel.watch();

  //running app
  runApp(MyApp(client:client,channel:channel));
}



