import 'package:flutter/material.dart';

import '../firebase/auth/auth_firebase_controller.dart';

class LoginScreenController extends ChangeNotifier {
  final _authFirebaseController = EmailAuthFirebaseController();

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
