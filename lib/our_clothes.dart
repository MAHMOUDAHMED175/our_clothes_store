import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/app/connectivity_controller.dart';
import 'package:our_clothes_store/core/app/env.variable.dart';
import 'package:our_clothes_store/core/common/screen/no_network_screen.dart';
import 'package:our_clothes_store/core/routes/app_routes.dart';
import 'package:our_clothes_store/core/style/fonts/font_family_helper.dart';
import 'package:our_clothes_store/core/style/fonts/font_weight_helper.dart';

class OurClothes extends StatelessWidget {
  const OurClothes({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            child: MaterialApp(
              title: 'OurClothes',
              debugShowCheckedModeBanner: EnvVaiable.instance.debugmod,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              initialRoute: AppRoutes.one,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Netwrok',
            debugShowCheckedModeBanner: EnvVaiable.instance.debugmod,
            home: const NoNetWorkScreen(),
          );
        }
      },
    );
  }
}
