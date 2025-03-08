import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFetchProfile {
  Future fetchProfile(String uid) async {
    try {
      print("======================================$uid");
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot snapshot =
          await firestore.collection('users').doc().get();
      return snapshot.data();
    } catch (e) {
      return e;
    }
  }
}
