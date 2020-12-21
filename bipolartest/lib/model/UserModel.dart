class User {
  String id;
  String name;
  String username;
  String photo;
  int followers;
  int following;
  int likes;
  bool isFollowing;
  List posts;
  String location;
  String email;

  User({
    this.id,
    this.name,
    this.username,
    this.photo,
  });

  factory User.fromMap(Map data) {
    return User(
      id: data["uid"],
      name: data["userName"],
      username: data["userName"],
      photo: data["profile_url"],
    );
  }
}
