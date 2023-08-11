import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final _auth = FirebaseAuth.instance;
  // late final firebaseUser;

  // @override
  // void onReady() {
  //   Future.delayed(const Duration(seconds: 6));
  //   firebaseUser = _auth.currentUser;
  //   firebaseUser.bindSteam(_auth.userChanges());
  //   ever(firebaseUser, _setInitialScreen);
  // }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> logout() async => await _auth.signOut();
}

final userService = UserService();
