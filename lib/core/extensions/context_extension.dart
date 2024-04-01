
import 'package:flutter/material.dart';
import 'package:our_clothes_store/core/style/theme/assets_extension.dart';
import 'package:our_clothes_store/core/style/theme/color_extension.dart';

extension ContextExt on BuildContext {



  MyColors get color=>Theme.of(this).extension<MyColors>()!;
  MyAssets get assets=>Theme.of(this).extension<MyAssets>()!;
  //Navigation

  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments,}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}
