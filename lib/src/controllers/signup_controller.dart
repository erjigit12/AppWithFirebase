import 'package:bir_urma_clone/src/controllers/session_controller.dart';
import 'package:bir_urma_clone/src/utils/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../utils/utils_error_message/error.dart';

class SignUpController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signup(BuildContext context, String userName, String email, String phone,
      String password) {
    setLoading(true);

    try {
      auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          SessionController().userId = value.user!.uid.toString();

          ref.child(value.user!.uid.toString()).set({
            'uid': value.user!.uid.toString(),
            'email': value.user!.email.toString(),
            'phone': phone,
            'userName': userName,
            'password': password,
            'onlineStatus': 'noOne',
            'profile': '',
          }).then((value) {
            setLoading(false);
            Navigator.pushNamed(context, RouteName.profileScreen);
          }).onError((error, stackTrace) {
            setLoading(false);
            Utils.toastMessage(error.toString());
          });
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
