import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String profilePhoto;
  String email;
  String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.profilePhoto,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "profilePhoto": profilePhoto,
        "uid": uid,
      };

  static UserModel fromSnap(DocumentSnapshot snapshot) {
    final snap = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      name: snap["name"],
      email: snap["email"],
      profilePhoto: snap["profilePhoto"],
      uid: snap["uid"],
    );
  }
}
