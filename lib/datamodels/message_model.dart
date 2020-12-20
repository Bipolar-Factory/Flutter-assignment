enum MessageType { text, image, audio, video }

class MessageModel {
  MessageType type;
  String text;
  String image;
  String audio;
  String video;
  String senderName;
  bool admin;

  MessageModel({
    MessageType type = MessageType.text,
    String text,
    String image,
    String audio,
    String video,
    String senderName,
    bool admin = false,
  }) {
    this.admin = admin;
    this.senderName = senderName;
    this.type = type;
    this.text = text ?? '';
    switch (type) {
      case MessageType.text:
        break;
      case MessageType.image:
        this.image = image;
        break;
      case MessageType.audio:
        this.audio = audio;
        break;
      case MessageType.video:
        this.video = video;
        break;
    }
  }
}
