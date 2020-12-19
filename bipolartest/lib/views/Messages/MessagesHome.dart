import 'package:bipolartest/data/AppData.dart';
import 'package:bipolartest/model/MessageModel.dart';
import 'package:bipolartest/model/UserModel.dart';
import 'package:bipolartest/views/HomePage.dart';
import 'package:bipolartest/views/Messages/widgets/MessageTile.dart';
import 'package:bipolartest/services/Extension.dart';
import 'package:bipolartest/views/Messages/widgets/OnlineUserTile.dart';

import 'package:flutter/material.dart';

class MessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<User> users = AppData.users.getRange(5, 10).toList();
    List<Message> messages = AppData.messages;

    final onlineFriends = Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return OnlineUserTile(
            user: users[index],
          ).fadeInList(index, false);
        },
      ),
    );

    final list = Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: ListView.separated(
          padding: EdgeInsets.only(bottom: 40.0),
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return MessageTile(
              message: messages[index],
            ).fadeInList(index, true);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.0);
          },
        ),
      ),
    );

    return HomeView(
      title: "Messages",
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [onlineFriends, list],
        ),
      ),
    );
  }
}
