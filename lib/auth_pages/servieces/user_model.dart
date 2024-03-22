import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? avatar;
  String name;
  String email;
  String uid;
  String? about;
  List<String>? images;

  UserModel({
    this.avatar,
    required this.name,
    required this.email,
    required this.uid,
    this.about,
    this.images,
  });

  factory UserModel.fromJson(DocumentSnapshot map) {
    return UserModel(
      avatar: map.data().toString().contains('avatar') ? map['avatar'] : null,
      name: map['name'],
      email: map['email'],
      uid: map['uid'],
      about: map.data().toString().contains('about') ? map['about'] : null,
      images: map.data().toString().contains('images')
          ? map['images'].map<String>((e) => e.toString()).toList()
          : null,
    );
  }
}
