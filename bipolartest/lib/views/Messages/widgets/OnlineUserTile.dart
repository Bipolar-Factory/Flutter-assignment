import 'package:bipolartest/global/circularimage.dart';
import 'package:bipolartest/global/utils/utils.dart';
import 'package:bipolartest/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:bipolartest/services/Extension.dart';

class OnlineUserTile extends StatelessWidget {
  final User user;

  const OnlineUserTile({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<bool> status = [false, true];
    status.shuffle();
    bool currentStatus = status[0];

    final userImage = Stack(
      children: <Widget>[
        Container(
          child: CircularImage(image: user.photo),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentStatus ? Colors.green : Colors.grey,
              border: Border.all(color: Colors.white, width: 2.0),
            ),
          ),
        )
      ],
    );

    final firstName = Text(
      user.name.firstName,
      style: Theme.of(context).textTheme.bodyText1,
    );

    return MaterialButton(
      onPressed: () => {},
      child: Container(
        child: Column(children: [
          userImage,
          Utils.verticalSpacer(space: 4),
          firstName,
        ]),
      ),
    );
  }
}
