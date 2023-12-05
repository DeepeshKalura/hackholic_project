import 'package:flutter/widgets.dart';

import '../firebase/user_firebase_controller.dart';
import '../firebase/auth/auth_firebase_controller.dart';

class RegisterScreenController extends ChangeNotifier {
  final _authFirebaseController = EmailAuthFirebaseController();

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
