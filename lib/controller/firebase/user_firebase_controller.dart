import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/models.dart';
import '../api/random_url_image_controller.dart';

class AddingUserFirebaseController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final RandomUrlImageController _randomUrlImageController =
      RandomUrlImageController();

  Future<void> addUser({
    required String userName,
    required String email,
    required String uid,
  }) async {
    try {
      UserModel user = UserModel(
        uid: uid,
        name: userName,
        email: email,
        imageUrl: _randomUrlImageController.random(),
      );

      await _firebaseFirestore.collection('users').doc(uid).set(
            user.toMap(),
          );
    } on FirebaseException catch (e) {
      developer.log(e.message.toString());
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      var res = await _firebaseFirestore.collection('users').doc(uid).get();
      UserModel user = UserModel.fromMap(res.data() as Map<String, dynamic>);
      return user;
    } on FirebaseException catch (e) {
      developer.log(e.message.toString());
      return null;
    }
  }
}
