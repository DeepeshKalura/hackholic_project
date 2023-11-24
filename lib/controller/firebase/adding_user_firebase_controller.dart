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

      await _firebaseFirestore.collection('users').add(
            user.toMap(),
          );
    } on FirebaseException catch (e) {
      developer.log(e.message.toString());
    }
  }
}
