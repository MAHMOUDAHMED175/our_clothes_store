import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/app/app_cubit/cubit/app_cubit_cubit.dart';
import 'package:our_clothes_store/core/app/connectivity_controller.dart';
import 'package:our_clothes_store/core/app/env.variable.dart';
import 'package:our_clothes_store/core/common/screen/no_network_screen.dart';
import 'package:our_clothes_store/core/di/injection_container.dart';
import 'package:our_clothes_store/core/language/app_localizations_setup.dart';
import 'package:our_clothes_store/core/routes/app_routes.dart';
import 'package:our_clothes_store/core/services/shared_pref/pref_keys.dart';
import 'package:our_clothes_store/core/services/shared_pref/shared_pref.dart';
import 'package:our_clothes_store/core/style/theme/app_theme.dart';
import 'package:overlay_support/overlay_support.dart';

class OurClothes extends StatelessWidget {
  const OurClothes({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) {
        if (value) {
          return BlocProvider(
            create: (context) => sl<AppCubitCubit>()
              ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              ),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              child: BlocBuilder<AppCubitCubit, AppCubitState>(
                builder: (context, state) {
                  final cubit = context.read<AppCubitCubit>();
                  return OverlaySupport.global(
                    child: MaterialApp(
                      navigatorKey: sl<GlobalKey<NavigatorState>>(),
                      title: 'OurClothes',
                      debugShowCheckedModeBanner:
                       EnvVariable.instance.debugMode,
                      theme: cubit.isDark ? themeDark() : themeLight(),
                      initialRoute: 
                      SharedPref()
                                  .getString(PrefKeys.accessToken) !=
                              null
                          ? SharedPref().getString(PrefKeys.userRole) != 'admin'
                              //ابقى اعكس الشاشات
                              ? AppRoutes.mainCustomer
                              : AppRoutes.homeAdmin
                            
                          : AppRoutes.login,
                      onGenerateRoute: AppRoutes.onGenerateRoute,
                      locale: Locale(cubit.currentLangCode),
                      supportedLocales: AppLocalizationsSetup.supportedLocales,
                      localizationsDelegates:
                          AppLocalizationsSetup.localizationsDelegates,
                      localeResolutionCallback:
                          AppLocalizationsSetup.localeResolutionCallback,
                      builder: (context, child) {
                        return GestureDetector(
                          onDoubleTap: () {
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          child: Scaffold(
                            body: Builder(
                              builder: (context) {
                                ConnectivityController.instance.init();
                                return child!;
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Netwrok',
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            home: const NoNetWorkScreen(),
          );
        }
      },
    );
  }
}
