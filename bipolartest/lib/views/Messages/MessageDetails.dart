import 'dart:io';

import 'package:bipolartest/data/AppData.dart';
import 'package:bipolartest/global/circularimage.dart';
import 'package:bipolartest/global/utils/utils.dart';
import 'package:bipolartest/model/MessageDetailsModel.dart';
import 'package:bipolartest/model/UserModel.dart';
import 'package:bipolartest/views/Messages/widgets/ChatBubble.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class MessageDetailsPage extends StatefulWidget {
  final User user;

  const MessageDetailsPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  _MessageDetailsPageState createState() => _MessageDetailsPageState();
}

class _MessageDetailsPageState extends State<MessageDetailsPage> {
  TextEditingController content = new TextEditingController();
  List<MessageDetails> messages = AppData.messageDetails;
  ScrollController _scrollController = ScrollController();

  void addMessage() {
    setState(() {
      if (content.text != "") {
        messages.add(MessageDetails(
          content: content.text,
          isFromMe: true,
          date: "Now",
        ));
        content.text = "";
      }
      _scrollController.animateTo(
        0.0,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final image = Hero(
      tag: "${widget.user.name}-image",
      child: CircularImage(
        size: 40.0,
        image: widget.user.photo,
      ),
    );

    final appBar = AppBar(
      elevation: 4,
      title: Row(
        children: <Widget>[
          image,
          Utils.horizontalSpacer(space: 10),
          Expanded(
            child: Text(
              widget.user.name,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.6),
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(FlutterIcons.videocamera_ant), onPressed: () => {}),
        IconButton(icon: Icon(FlutterIcons.phone_fea), onPressed: () => {}),
      ],
    );

    final chatContainer = ListView(
      controller: _scrollController,
      reverse: true,
      children: <Widget>[
        getMessages(),
      ],
    );

    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: Colors.transparent),
    );

    final bottom = Container(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 5,
        bottom: Platform.isIOS ? 15 : 5,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 6.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: content,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  hintText: "Type your message",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      LineAwesomeIcons.camera,
                      color: Theme.of(context).primaryColor,
                      size: 26,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => addMessage(),
                    icon: Icon(
                      LineAwesomeIcons.paper_plane,
                      color: Theme.of(context).primaryColor,
                      size: 26,
                    ),
                  ),
                  filled: true,
                  enabledBorder: outlineBorder,
                  border: outlineBorder),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(child: chatContainer),
            ),
            bottom
          ],
        ),
      ),
    );
  }

  Widget getMessages() {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < messages.length; i++) {
      list.add(ChatBubble(message: messages[i]));
    }
    return Column(children: list);
  }
}
