import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsFirebaseController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addComment({
    required String postId,
    required String uid,
    required String comment,
  }) async {
    await _firestore.collection('post').doc(postId).collection('comments').add({
      'uid': uid,
      'comment': comment,
      'time': DateTime.now(),
    });
  }

  Future<void> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    await _firestore
        .collection('post')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .delete();
  }

  Future<void> updateComment({
    required String postId,
    required String commentId,
    required String comment,
  }) async {
    await _firestore
        .collection('post')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .update({
      'comment': comment,
    });
  }

  Future<void> getAllComments({
    required String postId,
  }) async {
    await _firestore
        .collection('post')
        .doc(postId)
        .collection('comments')
        .orderBy('time', descending: true)
        .get();
  }
}
