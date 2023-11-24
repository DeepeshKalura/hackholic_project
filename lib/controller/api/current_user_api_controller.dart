import '../../model/user_model.dart';
import '../firebase/user_firebase_controller.dart';

class CurrentUserAPIController {
  final AddingUserFirebaseController _addingUserFirebaseController =
      AddingUserFirebaseController();

  Future<UserModel?> setCurrentUser(String? uid) async {
    return await _addingUserFirebaseController
        .getUser(uid ?? 'GnLyXJsPCSRQgtkvonA6dgU3Bra2');
  }
}
