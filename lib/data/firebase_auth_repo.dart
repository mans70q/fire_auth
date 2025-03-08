import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {
  FirebaseAuthRepo();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser user = AppUser(
        uid: firebaseAuth.currentUser!.uid,
        email: email,
        name: name,
      );
      await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(user.toJson());
      return firebaseAuth.currentUser!;
    } catch (e) {
      return e;
    }
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

  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }
}
