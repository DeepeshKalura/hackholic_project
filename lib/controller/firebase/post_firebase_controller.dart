import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/post_model.dart';
import '../../model/user_model.dart';

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

  Future<List<PostModel>> getPosts() async {
    List<PostModel> result = [];
    try {
      var querySnapshot = await _firebaseFirestore.collection('posts').get();

      for (var doc in querySnapshot.docs) {
        result.add(PostModel.fromMap(doc.data()));
      }
    } catch (e) {
      developer.log(e.toString());
    }
    return result;
  }
}
