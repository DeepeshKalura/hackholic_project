import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../firebase/user_firebase_controller.dart';

class CurrentUserAPIController extends ChangeNotifier {
  UserModel? currentUser;

  final AddingUserFirebaseController _addingUserFirebaseController =
      AddingUserFirebaseController();

  void setCurrentUser(String uuid) async {
    currentUser = await _addingUserFirebaseController.getUser(uuid);
    notifyListeners();
  }
}
