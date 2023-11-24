import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/post_model.dart';

class PostFirebaseController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addPost({required PostModel post, required String uid}) async {
    try {
      _firebaseFirestore.collection('posts').doc(uid).set(post.toMap());
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> getSinglePost(String id) async {
    try {
      _firebaseFirestore.collection('posts').doc(id).get();
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> getPost() async {
    try {} catch (e) {
      developer.log(e.toString());
    }
  }
}
