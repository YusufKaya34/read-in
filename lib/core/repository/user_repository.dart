// ignore_for_file: constant_identifier_names






import 'package:read_in/core/model/user_model.dart';
import 'package:read_in/core/services/auth_base.dart';
import 'package:read_in/core/services/fake_auth_services.dart';
import 'package:read_in/core/services/firebase_auth_service.dart';
import 'package:read_in/core/services/firestore_db_service.dart';
import 'package:read_in/core/services/locator.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();
  final FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

  final FakeAuthenticationService _fakeAuthenticationService =
      locator<FakeAuthenticationService>();

  AppMode appMode = AppMode.RELEASE;
  @override
  Future<MyUser?> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUser();
    } else {
      MyUser? _user = await _firebaseAuthService.currentUser();
      if (_user != null) {
        return await _firestoreDBService.readUser(_user.userID!);
      }
    }
    return null;
  }
  

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }


  @override
  Future<MyUser?> signInEmailAndPassword(String email, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInEmailAndPassword(
          email, password);
    } else {
      return await _firebaseAuthService.signInEmailAndPassword(email, password);
    }
  }

  @override
  Future<MyUser?> signUp(
    String email,
    String password,
  ) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signUp(
        email,
        password,
      );
    } else {
      MyUser? myUser = await _firebaseAuthService.signUp(
        email,
        password,
      );
      print('${myUser!.userID}');
      bool sonuc = await _firestoreDBService.saveUser(myUser);

      if (sonuc) {
        return myUser;
      } else {
        return null;
      }
    }
  }

  Future createUserName(String userID, String yeniUserName) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      return await _firestoreDBService.createUserName(userID, yeniUserName);
      
    }
  }

  Future<bool> createName(String userID, String yeniName) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {
      return await _firestoreDBService.createName(userID, yeniName);
    }
  }

 

  Future<List<MyUser>> getAllUser() async {
    if (appMode == AppMode.DEBUG) {
      return [];
    } else {
      var tumKullaniciListesi = await _firestoreDBService.getAllUser();
      return tumKullaniciListesi;
    }
  }




  
  @override
 Future sendPasswordResetEmail(String email)async {
     if (appMode == AppMode.DEBUG) {
      return true;
    } else {
      return await _firebaseAuthService.sendPasswordResetEmail(email);
    }
  }
}
