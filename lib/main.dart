import 'package:chaam/Screens/home.dart';
import 'package:chaam/app.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() {
  final client = StreamChatClient(streamKey);
  runApp(Chaam(
    client: client,
  ));
}
