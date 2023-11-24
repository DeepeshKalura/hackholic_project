import 'package:flutter/widgets.dart';

import '../firebase/adding_user_firebase_controller.dart';
import '../firebase/auth_firebase_controller.dart';

class RegisterScreenController extends ChangeNotifier {
  final AuthFirebaseController _authFirebaseController =
      AuthFirebaseController();

  final AddingUserFirebaseController _addingUserFirebaseController =
      AddingUserFirebaseController();

  Future<String> signUp(String email, String password, String userName) async {
    await _addingUserFirebaseController.addUser(
      userName: userName,
      email: email,
    );
    return await _authFirebaseController.signUp(email, password);
  }

  Future<String> signIn(String email, String password) async {
    return await _authFirebaseController.signIn(email, password);
  }

  Future<void> signOut() async {
    await _authFirebaseController.signOut();
  }
}
