import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebase/auth/auth_firebase_controller.dart';

class LoginScreenController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void init(AboutDialog aboutDialog) {
    _authFirebaseController = EmailAuthFirebaseController(auth: _auth);
  }

  late EmailAuthFirebaseController _authFirebaseController;

  Future<String> signIn(String email, String password) async {
    return await _authFirebaseController.signIn(email, password);
  }

  Future<String> signUp(String email, String password) async {
    return await _authFirebaseController.signUp(email, password);
  }

  Future<void> signOut() async {
    await _authFirebaseController.signOut();
  }
}
