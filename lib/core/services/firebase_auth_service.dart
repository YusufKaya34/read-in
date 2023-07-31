// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:read_in/core/model/user_model.dart';
import 'package:read_in/core/services/auth_base.dart';



class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<MyUser?> currentUser() async {
    try {
      User? user = _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      print("HATA CURRENT USER$e");
      return null;
    }
  }

  MyUser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    } else {
      //şimdilik name ve username boş geçildi
      return MyUser(
        userID: user.uid,
        email: user.email,
        
        
      );
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print('sign out hata $e');
      return false;
    }
  }

 
  @override
  Future<MyUser?> signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential sonuc = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(sonuc.user!);
    } catch (e) {
      print("SİGN İN EMAİL AND PASSWORD HATA:$e");
      return null;
    }
  }

  @override
  Future<MyUser?> signUp(
    String email,
    String password,
  ) async {
    try {
      UserCredential sonuc = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(sonuc.user);
    } catch (e) {
      print("SİGN UP HATA:$e");
      return null;
    }
  }

  @override
  Future sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print("PASSWORD RESET ERROR:$e");
      return false;
    }
  }
}
