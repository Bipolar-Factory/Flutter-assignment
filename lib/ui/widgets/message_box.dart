import 'package:flutter/material.dart';
import 'package:mimichat/datamodels/message_model.dart';

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
    if (message.senderName != null) return Colors.blue[100];
    return Colors.purple[100];
  }

  Color getBorderColor() {
    if (message.senderName != null) return Colors.blue[300];
    return Colors.purple[300];
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

  @override
  Widget build(BuildContext context) {
    print(message.senderName);
    if (message.admin) return adminMessage();
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
}
