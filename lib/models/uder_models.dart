class UserModel {
  String name;
  String userImage;
  String email;
  String uid;

  UserModel(
      {required this.email,
      required this.name,
      required this.uid,
      required this.userImage});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'],
        name: map['name'],
        uid: map['uid'],
        userImage: map['userImage']);
  }
}
