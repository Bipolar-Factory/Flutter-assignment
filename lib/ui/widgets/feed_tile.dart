import 'package:flutter/material.dart';
import 'package:mimichat/ui/views/chat/chat_view.dart';
import 'package:mimichat/ui/views/settings/settings_view.dart';

class FeedTile extends StatelessWidget {
  final String profileImage;
  final String name;
  final String lastMessage;
  final String time;
  final VoidCallback onPressed;

  const FeedTile({
    Key key,
    this.profileImage,
    this.name,
    this.lastMessage,
    this.time,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Color(0x336c63ff),
        highlightColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: name,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(profileImage)),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                name,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              time,
                              style: Theme.of(context).textTheme.subtitle1.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          lastMessage,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 12
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black26, width: 0.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
