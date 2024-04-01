
import 'package:flutter/material.dart';
import 'package:our_clothes_store/core/app/under_build_screen.dart';
import 'package:our_clothes_store/core/routes/base_routes.dart';
import 'package:our_clothes_store/one.dart';
import 'package:our_clothes_store/two.dart';

class AppRoutes {
  static const String one = 'one';
  static const String two = 'two';


  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case one:
        return BaseRoute(
          page:const One(),
        );
      case two:
        return BaseRoute(
          page:const Two(),
        );
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
