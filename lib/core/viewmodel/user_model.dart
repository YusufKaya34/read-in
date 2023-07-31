

import 'package:flutter/material.dart';
import 'package:read_in/core/model/user_model.dart';
import 'package:read_in/core/repository/user_repository.dart';
import 'package:read_in/core/services/auth_base.dart';
import 'package:read_in/core/services/locator.dart';


enum ViewState { idle, busy }

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.idle;
  final UserRepository _userRepository = locator<UserRepository>();
  MyUser? _user;
  String? emailHataMesaji;
  String? isimHataMesaji;
  String? usernameHataMesaji;
  String? birthdayHataMesaji;
  String? passwordHataMesaji;

  MyUser? get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<MyUser?> currentUser() async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.currentUser();
      if (_user != null) {
        return _user;
      } else {
        return null;
      }
    } catch (e) {
      print('VİEWMODELDEKİ CURRENT USER METHODU HATASI $e');
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  Future<List<MyUser>> getAllUser() async {
    var tumKullaniciListesi = await _userRepository.getAllUser();
    return tumKullaniciListesi;
  }

  @override
  Future<bool> signOut() async {
    try {
      print('çalıştı ');
      state = ViewState.busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    } catch (e) {
      print('VİEWMODELDEKİ SİGN OUT HATASI $e');
      return false;
    } finally {
      state = ViewState.idle;
    }
  }


  @override
  Future<MyUser?> signInEmailAndPassword(String email, String password) async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.signInEmailAndPassword(email, password);
      return _user;
    } catch (e) {
      print('VİEWMODELDEKİ SİGN IN EMAİL AND PASSWORD HATASI $e');
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<MyUser?> signUp(
    String email,
    String password,
  ) async {
    if (_emailPasswordControl(
      email,
      password,
    )) {
      try {
        state = ViewState.busy;
        _user = await _userRepository.signUp(
          email,
          password,
        );
        return _user;
      } finally {
        state = ViewState.idle;
      }
    } else {
      return null;
    }
  }

  bool _emailPasswordControl(
    String email,
    String password,
  ) {
    var sonuc = true;
    if (password.length < 6) {
      passwordHataMesaji = 'En az 6 karakter olmalı';
      sonuc = false;
    } else {
      passwordHataMesaji = null;
    }
    if (!email.contains('@')) {
      emailHataMesaji = 'Geçersiz email adresi';
      sonuc = false;
    } else {
      emailHataMesaji = null;
    }

    return sonuc;
  }

  Future createUserName(String userID, String yeniUserName) async {
    state = ViewState.busy;
    var sonuc = await _userRepository.createUserName(userID, yeniUserName);
    state = ViewState.idle;
    return sonuc;
  }

  Future<bool> createName(String userID, String yeniName) async {
    state = ViewState.busy;
    var sonuc = await _userRepository.createName(userID, yeniName);
    state = ViewState.idle;
    return sonuc;
  }



  @override
  Future sendPasswordResetEmail(String email) async {
    state = ViewState.busy;
    var sonuc = await _userRepository.sendPasswordResetEmail(email);
    state = ViewState.idle;
    return sonuc;
  }
}
