import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class SearchUserFirebaseController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> searchUser(String query) async {
    List<UserModel> users = [];
    try {
      _firestore
          .collection('users')
          .where('name', isGreaterThanOrEqualTo: query)
          .get()
          .then((value) => value.docs.forEach((element) {
                users.add(UserModel.fromMap(element.data()));
              }));
    } catch (e) {
      developer.log(e.toString());
    }
    return users;
  }
}
