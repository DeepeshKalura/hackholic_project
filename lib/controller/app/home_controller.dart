import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../api/current_user_api_controller.dart';

class HomeController extends ChangeNotifier {
  UserModel currentUser = UserModel(
    uid: 'MVCKOyhxr2M13iqOGWKkPkWujBk2',
    email: 'maha123@gmail.com',
    name: 'mahajan',
    imageUrl:
        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  );

  final _currentUserAPIController = CurrentUserAPIController();

  void setCurrentUser(String? uid) async {
    var res = await _currentUserAPIController.setCurrentUser(uid);
    currentUser = res ?? currentUser;
    notifyListeners();
  }
}
