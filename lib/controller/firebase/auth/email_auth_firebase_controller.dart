import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthFirebaseController {
  final _auth = FirebaseAuth.instance;

  Future<String> signUp(
    String email,
    String password,
  ) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user!.uid;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
