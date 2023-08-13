import 'package:bir_urma_clone/src/controllers/session_controller.dart';
import 'package:bir_urma_clone/src/utils/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/utils_error_message/error.dart';

class LoginController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) {
    setLoading(true);

    try {
      auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          SessionController().userId = value.user!.uid.toString();

          setLoading(false);
          Navigator.pushNamed(context, RouteName.profileScreen);
        },
      ).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }

  void signOut(BuildContext context) {
    auth.signOut().then(
      (value) {
        SessionController().userId = '';
        Navigator.pushNamed(context, RouteName.loginScreen);
      },
    ).onError(
      (error, stackTrace) {
        Utils.toastMessage(error.toString());
      },
    );
  }
}
