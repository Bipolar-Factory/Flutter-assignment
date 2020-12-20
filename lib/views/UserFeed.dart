import 'package:flutter/material.dart';
import 'package:intern_chat/views/ChatInstance.dart';
import 'package:intern_chat/data/UserData.dart';

class UserFeed extends StatefulWidget {
  @override
  _UserFeedState createState() => _UserFeedState();
}

class _UserFeedState extends State<UserFeed> {
  //Object to get user list from Data class
  Data userData = Data();

  @override
  void initState() {
    // TODO: implement initState
    wait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Demo"),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue[800], Colors.blue[200]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          //Using listview builder to create users
          itemCount: 6,
          itemBuilder: (context, index) {
            return ChatTile(user: userData.userList[index]);
          },
        ),
      ),
    );
  }

  wait() async {
    await Future.delayed(Duration(milliseconds: 400));
    if (mounted) {
      setState(() {});
    }
  }
}

class ChatTile extends StatelessWidget {
  //This is used to create a tile for each user.
  final UserData user;

  const ChatTile({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color.fromARGB(40, 0, 0, 0))),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(context, newPage(user.name));
            //To push Chat of selected user onto the screen on top of the current one
          },
          title: Text(user.name ?? "username"),
          subtitle: Text(user.lastMessage ?? "Last Message"),
          trailing: Text(user.lastTime ?? "12:00"),
          leading: CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: Container(
                  width: 55,
                  color: Colors.blue,
                  child: Image.asset(user.imagePath)),
            ),
          ),
        ),
      ),
    );
  }

  Route newPage(String username) {
    //Transition animation to a new page
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, duration, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offSetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offSetAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, duration) =>
          ChatInstance(targetUsername: username),
    );
  }
}
