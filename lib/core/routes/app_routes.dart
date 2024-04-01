
import 'package:flutter/material.dart';
import 'package:our_clothes_store/core/app/under_build_screen.dart';
import 'package:our_clothes_store/core/routes/base_routes.dart';
import 'package:our_clothes_store/features/auth/presentation/screens/login_screen.dart';


class AppRoutes {
  static const String login = 'login';
 


  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return BaseRoute(
          page:const LoginScreen(),
        );
     
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
