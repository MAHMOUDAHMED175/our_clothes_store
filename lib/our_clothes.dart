import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/app/connectivity_controller.dart';
import 'package:our_clothes_store/core/app/env.variable.dart';
import 'package:our_clothes_store/core/common/screen/no_network_screen.dart';
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
              home: const Scaffold(
                body: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'YourMAHMOUD ahmed ??',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontFamilyHelper.poppinsEnglish,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      Text(
                        'هل انت محمود احمد ??',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontFamilyHelper.cairoArabic,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ],
                  ),
                ),
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
