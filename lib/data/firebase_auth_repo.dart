import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {
  FirebaseAuthRepo();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return firebaseAuth.currentUser!;
  }

  Future signInWithEmailAndPassword({
    required String password,
    required String email,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return firebaseAuth.currentUser!;
    } catch (e) {
      return e;
    }
  }

  Future sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e;
    }
  }

  Future<void> verifyEmail() async {
    await firebaseAuth.currentUser!.sendEmailVerification();
  }

  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }
}
