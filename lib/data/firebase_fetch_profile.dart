import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_auth/data/model/user_model.dart';

class FirebaseFetchProfile {
  Future fetchProfile(String uid) async {
    try {
      print("======================================$uid");
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot snapshot =
          await firestore.collection('users').doc(uid).get();
      AppUser user = AppUser.fromJson(snapshot.data() as Map<String, dynamic>);
      print(snapshot.data());
      return user;
    } catch (e) {
      return e;
    }
  }
}
