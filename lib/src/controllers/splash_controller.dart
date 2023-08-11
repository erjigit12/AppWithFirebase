import 'dart:async';
import 'package:bir_urma_clone/src/controllers/session_controller.dart';
import 'package:bir_urma_clone/src/utils/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashController {
  void isLogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      SessionController().userId = user.uid.toString();
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushNamed(context, RouteName.profileScreen);
        },
      );
    } else {
      (
        Timer(
          const Duration(seconds: 3),
          () {
            Navigator.pushNamed(context, RouteName.loginScreen);
          },
        ),
      );
    }
  }
}
