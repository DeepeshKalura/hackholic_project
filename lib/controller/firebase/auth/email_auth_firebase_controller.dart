import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthFirebaseController {
  final FirebaseAuth auth;

  EmailAuthFirebaseController({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  Future<String> signUp(
    String email,
    String password,
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      return "Success";
    } on FirebaseAuthException catch (e) {
      developer.log(e.message ?? "FirebaseAuthException has the issue");
      return "FirebaseAuthException has the issue";
    } catch (e) {
      developer.log(e.toString());
      return "Catch has the issue";
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      developer.log(e.message ?? "FirebaseAuthException has the issue");
      return "FirebaseAuthException has the issue";
    } catch (e) {
      developer.log(e.toString());
      return "Catch has the issue";
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      developer.log(e.message ?? "FirebaseAuthException has the issue");
    } catch (e) {
      developer.log(e.toString());
    }
  }
}
