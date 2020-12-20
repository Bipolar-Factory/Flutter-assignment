import 'package:mimichat/app/locator.dart';
import 'package:mimichat/datamodels/message_model.dart';
import 'package:mimichat/managers/chat_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// class ChatViewModel extends StreamViewModel<MessageModel>{
//   ChatManager _chatManager = locator<ChatManager>();
//   NavigationService _navigator = locator<NavigationService>();
//
//   List<MessageModel> messages = [];
//
//   @override
//   void onData(MessageModel data) {
//     messages.add(data);
//     super.onData(data);
//   }
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
//
//   @override
//   Stream<MessageModel> get stream => _chatManager.chatStream;
// }

class ChatViewModel extends BaseViewModel{
  ChatManager _chatManager = locator<ChatManager>();
  NavigationService _navigator = locator<NavigationService>();

  List<MessageModel> messages = [];

  // @override
  // void onData(MessageModel data) {
  //   messages.add(data);
  //   super.onData(data);
  // }

  void sendText(String message){
    MessageModel _message = MessageModel(
      text: message,
    );
    _chatManager.addMessage(_message);
    MessageModel _reply = MessageModel(
      text: "This is just a dummy reply. Don't pay much attention!",
      senderName: 'Text',
    );
    _chatManager.addMessage(_reply);
  }

  void back(){
    _navigator.back();
  }
}