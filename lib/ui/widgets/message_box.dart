import 'package:flutter/material.dart';
import 'package:mimichat/datamodels/message_model.dart';
import 'package:mimichat/ui/widgets/audio_box.dart';
import 'package:mimichat/ui/widgets/video_box.dart';

class MessageBox extends StatelessWidget {
  final MessageModel message;

  const MessageBox({Key key, this.message}) : super(key: key);

  Alignment getAlignment() {
    if (message.senderName != null) return Alignment.centerLeft;
    return Alignment.centerRight;
  }

  BorderRadius getBorderRadius() {
    if (message.senderName != null) {
      return BorderRadius.only(
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      );
    }
    return BorderRadius.only(
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      topLeft: Radius.circular(16),
    );
  }

  Color getColor() {
    if (message.senderName != null) return Color(0x886c63ff);
    return Colors.white;
  }

  Color getBorderColor() {
    // if (message.senderName != null) return Color(0xff6c63ff);
    // return Colors.black54;
    return Color(0xff6c63ff);
  }

  Widget adminMessage() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(message.text),
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: Colors.orange[300])
        ),
      ),
    );
  }

  Widget textMessage(BuildContext context){
    return Container(
      alignment: getAlignment(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(12),
          child: Text(message.text),
          decoration: BoxDecoration(
              color: getColor(),
              borderRadius: getBorderRadius(),
              border: Border.all(color: getBorderColor())
          ),
        ),
      ),
    );
  }

  Widget imageMessage(BuildContext context){
    return Container(
      alignment: getAlignment(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(message.image),
              Text(message.text),
            ],
          ),
          decoration: BoxDecoration(
              color: getColor(),
              borderRadius: getBorderRadius(),
              border: Border.all(color: getBorderColor())
          ),
        ),
      ),
    );
  }

  Widget videoMessage(BuildContext context){
    return Container(
      alignment: getAlignment(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              VideoBox(video: message.video),
              Text(message.text),
            ],
          ),
          decoration: BoxDecoration(
              color: getColor(),
              borderRadius: getBorderRadius(),
              border: Border.all(color: getBorderColor())
          ),
        ),
      ),
    );

  }

  Widget audioMessage(BuildContext context) {
    return Container(
      alignment: getAlignment(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery
            .of(context)
            .size
            .width * 0.7),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              AudioBox(),
              Text(message.text),
            ],
          ),
          decoration: BoxDecoration(
              color: getColor(),
              borderRadius: getBorderRadius(),
              border: Border.all(color: getBorderColor())
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(message.senderName);
    if (message.admin) return adminMessage();
    else if(message.type == MessageType.text) return textMessage(context);
    else if(message.type == MessageType.image) return imageMessage(context);
    else if(message.type == MessageType.video) return videoMessage(context);
    return audioMessage(context);
  }
}
