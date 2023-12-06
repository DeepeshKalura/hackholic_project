import 'package:flutter/widgets.dart';

import '../firebase/user_firebase_controller.dart';
import '../firebase/auth/auth_firebase_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreenController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RegisterScreenController() {
    init();
  }
  void init() {
    _authFirebaseController = EmailAuthFirebaseController(auth: _auth);
  }

  late EmailAuthFirebaseController _authFirebaseController;

  final AddingUserFirebaseController _addingUserFirebaseController =
      AddingUserFirebaseController();

  Future<void> signUp(String email, String password, String userName) async {
    var result = await _authFirebaseController.signUp(email, password);
    return await _addingUserFirebaseController.addUser(
      userName: userName,
      email: email,
      uid: result,
    );
  }

  Future<String> signIn(String email, String password) async {
    return await _authFirebaseController.signIn(email, password);
  }

  Future<void> signOut() async {
    await _authFirebaseController.signOut();
  }
}
