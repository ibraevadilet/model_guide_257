import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:model_guide_257/auth_pages/servieces/user_model.dart';

class FBAuthService {
  final auth = FirebaseAuth.instance;

  Future<UserModel> signIn(String login, String psw) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: login,
        password: psw,
      );
      CollectionReference firestore =
          FirebaseFirestore.instance.collection('users');
      DocumentSnapshot user = await firestore.doc(login).get();
      return UserModel.fromJson(user);
    } catch (e) {
      auth.signOut();
      throw e.toString();
    }
  }

  Future<UserModel> signUp({
    required String name,
    required String login,
    required String psw,
    String? avatar,
  }) async {
    try {
      UserCredential cred = await auth.createUserWithEmailAndPassword(
        email: login,
        password: psw,
      );

      CollectionReference firestore =
          FirebaseFirestore.instance.collection('users');

      final model = {
        'name': name,
        'email': login,
        'uid': cred.user?.uid,
        'password': psw,
      };
      String? url;
      if (avatar != null) {
        url = await uploadImage(File(avatar));

        model.addEntries(
          {"avatar": url}.entries,
        );
      }
      await firestore.doc(login).set(model);
      return UserModel(
        about: '',
        avatar: url,
        name: name,
        email: login,
        uid: cred.user!.uid,
        images: [],
      );
    } catch (e) {
      throw e.toString();
    }
  }
}

Future<String> uploadImage(File file) async {
  final metadata = SettableMetadata(contentType: 'image/jpeg');
  final storageRef = FirebaseStorage.instance.ref();

  Reference ref =
      storageRef.child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
  final uploadTask = ref.putFile(file, metadata);
  final taskSnapshot = await uploadTask.whenComplete(() => null);

  String url = await taskSnapshot.ref.getDownloadURL();
  return url;
}
