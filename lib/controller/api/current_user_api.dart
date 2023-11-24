import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class CurrentUser extends ChangeNotifier {
  UserModel? currentUser;

  void setCurrentUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }
}
