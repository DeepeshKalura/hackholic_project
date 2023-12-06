import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthFirebaseController {
  final FirebaseAuth auth;

  EmailAuthFirebaseController({required this.auth});

  Future<String> signUp(
    String email,
    String password,
  ) async {
    try {
      var result = await auth.createUserWithEmailAndPassword(
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
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
