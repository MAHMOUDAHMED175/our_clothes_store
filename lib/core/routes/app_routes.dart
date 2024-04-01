
import 'package:flutter/material.dart';
import 'package:our_clothes_store/core/common/screen/under_build_screen.dart';
import 'package:our_clothes_store/core/routes/base_routes.dart';
import 'package:our_clothes_store/features/auth/presentation/screens/login_screen.dart';
import 'package:our_clothes_store/features/auth/presentation/screens/sign_up_screen.dart';


class AppRoutes {
  static const String login = 'login';
  static const String signUp = 'sign_up';
 


  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return BaseRoute(
          page:const LoginScreen(),
        );
      case signUp:
        return BaseRoute(
          page:const SignUpScreen(),
        );
     
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
