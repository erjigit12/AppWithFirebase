import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/routes/route_name.dart';
import '../utils/utils_error_message/error.dart';

class ForgotPasswordController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void forgotPassword(BuildContext context, String email) {
    setLoading(true);

    try {
      auth
          .sendPasswordResetEmail(
        email: email,
      )
          .then(
        (value) {
          setLoading(false);
          Navigator.pushNamed(context, RouteName.loginScreen);
          Utils.toastMessage(
            'Please check your email to recover your password',
          );
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
}
