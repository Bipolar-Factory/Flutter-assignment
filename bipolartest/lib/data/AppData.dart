import 'package:bipolartest/model/MessageDetailsModel.dart';
import 'package:bipolartest/model/MessageModel.dart';
import 'package:bipolartest/model/UserModel.dart';

import 'images.dart';

class AppData {
  static List<User> users = [
    User(
      name: "Emmanuel Fache",
      username: "emrade",
      photo: AppImages.user0,
    ),
    User(
      name: "Caroline Forbs",
      username: "karo",
      photo: AppImages.woman1,
    ),
    User(
      name: "Sue Caldwel",
      username: "sue",
      photo: AppImages.woman2,
    ),
    User(
      name: "Alicia Monroe",
      username: "ally",
      photo: AppImages.woman3,
    ),
    User(
      name: "Adnan Heyes",
      username: "adnan",
      photo: AppImages.man1,
    ),
    User(
      name: "Christopher Jenkins",
      username: "chris",
      photo: AppImages.man2,
    ),
    User(
      name: "Danielle Rosa",
      username: "dani",
      photo: AppImages.woman,
    ),
    User(
      name: "Mich Justin",
      username: "mich",
      photo: AppImages.man3,
    ),
    User(
      name: "Laura H.",
      username: "laura",
      photo: AppImages.woman4,
    ),
    User(
      name: "Kelly R.",
      username: "kelly",
      photo: AppImages.woman5,
    ),
  ];

  static List<Message> messages = [
    Message(
      user: users[5],
      time: "9:20 AM",
      unread: 5,
      content: "Hey! How's it going? 😅.",
    ),
    Message(
      user: users[1],
      time: "8:10 AM",
      unread: 0,
      content: "What kind of music do you like?",
    ),
    Message(
      user: users[2],
      time: "Yesterday",
      unread: 1,
      content: "Sounds good to me",
    ),
    Message(
      user: users[3],
      time: "2d ago",
      unread: 0,
      content: "I see you had a good night 😉",
    ),
    Message(
      user: users[4],
      time: "3d ago",
      unread: 2,
      content: "What did you do over the weekend?",
    ),
    Message(
      user: users[6],
      time: "Yesterday",
      unread: 1,
      content: "Sounds good to me",
    ),
    Message(
      user: users[7],
      time: "2d ago",
      unread: 0,
      content: "I see you had a good night 😉",
    ),
    Message(
      user: users[8],
      time: "3d ago",
      unread: 2,
      content: "What did you do over the weekend?",
    ),
  ];

  static List<MessageDetails> messageDetails = [
    MessageDetails(
        content: "Hey there, how are you doing?",
        isFromMe: true,
        date: "Tuesday 9:20 AM",
        type: ''),
    MessageDetails(
        content: 'https://i.imgur.com/rSLVCoY.jpg',
        isFromMe: false,
        date: "Tuesday 10:00 AM",
        type: 'image'),
    MessageDetails(
        content: "Just fine. I was about to call you, i miss you.",
        isFromMe: false,
        date: "Tuesday 10:00 AM",
        type: ''),
    MessageDetails(
        content: "Check This Video Out!!",
        isFromMe: true,
        date: "Tuesday 9:20 AM",
        type: ''),
    MessageDetails(
      isFromMe: true,
      date: "Wednesday 12:13 PM",
      type: 'video',
    ),
    MessageDetails(
        content: "Cool Video!!!",
        isFromMe: false,
        date: "Tuesday 9:20 AM",
        type: ''),
  ];
}
