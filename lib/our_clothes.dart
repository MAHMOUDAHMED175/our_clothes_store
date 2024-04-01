import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/app/connectivity_controller.dart';
import 'package:our_clothes_store/core/app/env.variable.dart';
import 'package:our_clothes_store/core/common/screen/no_network_screen.dart';

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
              home: Scaffold(
                appBar: AppBar(title: const Icon(Icons.reddit)),
              ),
              builder: (context, child) {
                return Scaffold(
                  body: Builder(
                    builder: (context) {
                      ConnectivityController.instance.init();
                      return child!;
                    },
                  ),
                );
              },
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
