import 'package:mimichat/app/constants.dart';
import 'package:mimichat/app/locator.dart';
import 'package:mimichat/datamodels/message_model.dart';
import 'package:mimichat/managers/chat_manager.dart';
import 'package:mimichat/services/local_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatViewModel extends StreamViewModel<MessageModel>{
  ChatManager _chatManager = locator<ChatManager>();
  NavigationService _navigator = locator<NavigationService>();
  LocalDataService _localData = locator<LocalDataService>();

  List<MessageModel> messages = [];

  @override
  void onData(MessageModel data) {
    messages.add(data);
    super.onData(data);
  }

  void sendText(String message){
    if(message.isEmpty) return;
    MessageModel _message = MessageModel(
      text: message,
    );
    _chatManager.addMessage(_message);
    MessageModel _reply = MessageModel(
      text: "Hey ${_localData.user.name}! This is just a dummy reply. Don't pay much attention!",
      senderName: 'Text',
    );
    _chatManager.addMessage(_reply);
  }

  void startMimic(String name){
    MessageModel _imageMessage = MessageModel(
      text: 'Check this Image!',
      type: MessageType.image,
      image: profile1Image,
    );
    _chatManager.addMessage(_imageMessage);

    MessageModel _audioMessage = MessageModel(
      text: 'Check this Audio!',
      type: MessageType.audio,
      audio: testVideo,
      senderName: name
    );
    _chatManager.addMessage(_audioMessage);

    MessageModel _videoMessage = MessageModel(
      text: 'Check this Video!',
      type: MessageType.video,
      video: testVideo,
    );
    _chatManager.addMessage(_videoMessage);
  }

  void back(){
    _navigator.back();
  }

  @override
  Stream<MessageModel> get stream => _chatManager.chatStream;
}

// class ChatViewModel extends BaseViewModel{
//   ChatManager _chatManager = locator<ChatManager>();
//   NavigationService _navigator = locator<NavigationService>();
//
//   List<MessageModel> messages = [];
//
//   // @override
//   // void onData(MessageModel data) {
//   //   messages.add(data);
//   //   super.onData(data);
//   // }
//
//   void sendText(String message){
//     MessageModel _message = MessageModel(
//       text: message,
//     );
//     _chatManager.addMessage(_message);
//     MessageModel _reply = MessageModel(
//       text: "This is just a dummy reply. Don't pay much attention!",
//       senderName: 'Text',
//     );
//     _chatManager.addMessage(_reply);
//   }
//
//   void back(){
//     _navigator.back();
//   }
// }