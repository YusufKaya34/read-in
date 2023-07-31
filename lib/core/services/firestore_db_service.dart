

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:read_in/core/model/user_model.dart';
import 'package:read_in/core/services/database.dart';


class FirestoreDBService implements DB {
  final FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(MyUser user) async {
    DocumentSnapshot _okunanUser =
        await FirebaseFirestore.instance.doc("users/${user.userID}").get();

    if (_okunanUser.data() == null) {
   
      await _firebaseDB.collection("users").doc(user.userID).set(user.toMap());
      return true;
    } else {
      return true;
    }
  }

  @override
  Future<MyUser> readUser(String userID) async {
    DocumentSnapshot _okunanUser =
        await _firebaseDB.collection("users").doc(userID).get();

    MyUser _okunanUserNesnesi =
        MyUser.fromMap(_okunanUser.data() as Map<String, dynamic>);
    return _okunanUserNesnesi;
  }

  @override
  Future<bool> createUserName(String userID, String yeniUserName) async {
    var users = await _firebaseDB
        .collection("users")
        .where("username", isEqualTo: yeniUserName)
        .get();
    if (users.docs.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .doc(userID)
          .update({'username': yeniUserName});
      return true;
    }
  }

  Future<bool> createName(String userID, String yeniName) async {
    var users = await _firebaseDB
        .collection("users")
        .where("name", isEqualTo: yeniName)
        .get();
    if (users.docs.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .doc(userID)
          .update({'name': yeniName});
      return true;
    }
  }

  @override
  Future<List<MyUser>> getAllUser() async {
    QuerySnapshot querySnapshot = await _firebaseDB
        .collection("users")
        .orderBy("createdAt", descending: true)
        .get();
    List<MyUser> tumKullanicilar = [];
    tumKullanicilar = querySnapshot.docs
        .map((e) => MyUser.fromMap(e.data() as Map<String, dynamic>))
        .toList();
    return tumKullanicilar;
  }


}
