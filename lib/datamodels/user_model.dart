class UserModel{
  String name;

  UserModel({this.name});

  UserModel.fromJson(Map<String, dynamic> m){
    this.name = m['name'];
  }

  Map<String, dynamic> toJson(){
    return {
      'name': this.name,
    };
  }

}