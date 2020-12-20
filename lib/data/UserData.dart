class UserData{
  //User data to display in chat list
  final String name;
  final String imagePath;
  final String lastMessage;
  final String lastTime;

  UserData(this.name, this.imagePath, this.lastMessage, this.lastTime);

}

class Data
{
  //List of user data
  List<UserData> userList = []..add(UserData(
      'Samantha', "assets/images/user1.jpg", "You shared a video", "13:47"))
    ..add(UserData(
        'Robert', "assets/images/user2.jpg", "You shared a video", "12:23"))
    ..add(UserData(
        'Samuel', "assets/images/user3.jpg", "You shared a video", "11:45"))
    ..add(UserData(
        'Jack', "assets/images/user4.jpg", "You shared a video", "09:09"))
    ..add(UserData(
        'Rami', "assets/images/user5.jpg", "You shared a video", "06:06"))
    ..add(UserData(
        'Jojo', "assets/images/user6.jpg", "You shared a video", "04:22"));
}


