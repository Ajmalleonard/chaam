import 'package:flutter/material.dart';

@immutable
class MessagesModel {
  final String userName;
  final String message;
  final DateTime messageTime;
  final String dateMessage;
  final String profilePicture;

  const MessagesModel(
      {required this.userName,
      required this.message,
      required this.messageTime,
      required this.dateMessage,
      required this.profilePicture});
}
