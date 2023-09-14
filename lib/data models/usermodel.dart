//for the wrapper to decide between login screen and home screen
class UserStreamDataModel {
  String? uid;
  UserStreamDataModel({required this.uid});
}
// for storing and fetching the user data from firebase
class UserModel {
  UserModel({
    required this.createdAt,
    this.image,
    required this.lastActive,
    required this.about,
    required this.name,
    required this.isOnline,
    required this.id,
    required this.pushToken,
    required this.email,
  });
  late final String createdAt;
  late final String? image;
  late final String lastActive;
  late final String about;
  late final String name;
  late final bool isOnline;
  late final String id;
  late final String pushToken;
  late final String email;
  
  UserModel.fromJson(Map<String, dynamic> json){
    createdAt = json['createdAt'];
    image = json['image'];
    lastActive = json['lastActive'];
    about = json['about'];
    name = json['name'];
    isOnline = json['isOnline'];
    id = json['id'];
    pushToken = json['pushToken'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['image'] = image;
    data['lastActive'] = lastActive;
    data['about'] = about;
    data['name'] = name;
    data['isOnline'] = isOnline;
    data['id'] = id;
    data['pushToken'] = pushToken;
    data['email'] = email;
    return data;
  }
}