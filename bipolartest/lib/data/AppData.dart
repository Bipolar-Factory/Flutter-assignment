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
      followers: 89627272,
      following: 0,
      likes: 2387733,
    ),
    User(
      name: "Caroline Forbs",
      username: "karo",
      photo: AppImages.woman1,
      followers: 26628,
      following: 2772,
      likes: 3663,
      isFollowing: true,
    ),
    User(
      name: "Sue Caldwel",
      username: "sue",
      photo: AppImages.woman2,
      followers: 26628,
      following: 2772,
      likes: 3663,
    ),
    User(
      name: "Alicia Monroe",
      username: "ally",
      photo: AppImages.woman3,
      followers: 26628,
      following: 2772,
      likes: 3663,
      isFollowing: true,
    ),
    User(
      name: "Adnan Heyes",
      username: "adnan",
      photo: AppImages.man1,
      followers: 26628,
      following: 2772,
      likes: 3663,
    ),
    User(
      name: "Christopher Jenkins",
      username: "chris",
      photo: AppImages.man2,
      followers: 26628,
      following: 2772,
      likes: 3663,
      isFollowing: true,
    ),
    User(
      name: "Danielle Rosa",
      username: "dani",
      photo: AppImages.woman,
      followers: 26628,
      following: 2772,
      likes: 3663,
    ),
    User(
      name: "Mich Justin",
      username: "mich",
      photo: AppImages.man3,
      followers: 26628,
      following: 2772,
      likes: 3663,
      isFollowing: true,
    ),
    User(
      name: "Laura H.",
      username: "laura",
      photo: AppImages.woman4,
      followers: 26628,
      following: 2772,
      likes: 3663,
    ),
    User(
      name: "Kelly R.",
      username: "kelly",
      photo: AppImages.woman5,
      followers: 26628,
      following: 2772,
      likes: 3663,
      isFollowing: true,
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
    ),
    MessageDetails(
      content: "Just fine. I was about to call you, i miss you.",
      isFromMe: false,
      date: "Tuesday 10:00 AM",
    ),
    MessageDetails(
      content: "oh yeah? ",
      isFromMe: true,
      date: "Wednesday 12:13 PM",
    ),
  ];
}
