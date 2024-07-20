import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.model.dart';

class DatabaseService {
  final String? uid;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("Users");

  static final defaultUser = {
    "name": "",
    "points": 0,
    "age": 0,
    "height": 0,
    "weight": 0,
    "email": "",
    "phoneNum": "",
    "often": 0,
    "intensity": 0,
    "strength": 0,
    "flexibility": 0,
    "cardio": 0,
    "activities": [],
  };

  DatabaseService({this.uid});

  Stream<UserData?> get userData {
    return usersCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  Future updateUserData(Map<String, dynamic> json) async {
    return await usersCollection.doc(uid).set(json, SetOptions(merge: true));
  }

  UserData? _userDataFromSnapshot(DocumentSnapshot snapshot) {
    try {
      Map<String, dynamic> d = snapshot.data() as Map<String, dynamic>;
      UserData ret = UserData.fromJson(d);

      return ret;
    } catch (error) {
      return null;
    }
  }

  Future<UserData?> getData() async {
    try {
      final snapshot = await usersCollection.doc(uid).get();
      final userData = snapshot.data() as Map<String, dynamic>;

      var pushData = <String, dynamic>{};
      var needsPush = false;

      for (var key in defaultUser.keys) {
        if (!userData.containsKey(key)) {
          pushData[key] = defaultUser[key];
          userData[key] = defaultUser[key];
          needsPush = true;
        }
      }

      if (needsPush) {
        await updateUserData(pushData);
      }

      return UserData.fromJson(userData);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
