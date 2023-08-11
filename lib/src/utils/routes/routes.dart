import 'package:bir_urma_clone/src/modules/authentication/forgot_password/forgot_password.dart';
import 'package:bir_urma_clone/src/modules/authentication/login/login_screen.dart';
import 'package:bir_urma_clone/src/modules/authentication/signup/signup_screen.dart';
import 'package:bir_urma_clone/src/modules/profile/views/profildi_ondoo_page.dart';
import 'package:bir_urma_clone/src/modules/profile/views/profile_screen.dart';
import 'package:bir_urma_clone/src/modules/profile/views/sunush_pikirler_page.dart';
import 'package:bir_urma_clone/src/modules/splash/splash_screen.dart';
import 'package:bir_urma_clone/src/utils/routes/route_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteName.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteName.sunushPikirScreen:
        return MaterialPageRoute(builder: (_) => const SunushPikirlerPage());
      case RouteName.changeProfileAndPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ProfildiOndoo());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
