import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mimichat/datamodels/message_model.dart';

@injectable
class ChatManager{
  StreamController<MessageModel> _chatController;

  ChatManager(){
    _chatController = StreamController<MessageModel>();
    _chatController.add(MessageModel(
      type: MessageType.text,
      text: "Press Attachment button to start Mimicing",
      admin: true,
    ));
  }

  Stream<MessageModel> get chatStream => _chatController.stream;

  void addMessage(MessageModel message){
    _chatController.add(message);
  }
}