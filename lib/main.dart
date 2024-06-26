import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_clothes_store/core/app/bloc_observer.dart';
import 'package:our_clothes_store/core/app/env.variable.dart';
import 'package:our_clothes_store/core/di/injection_container.dart';
import 'package:our_clothes_store/core/services/dynamic_link/dynamic_link.dart';
import 'package:our_clothes_store/core/services/hive/hive_database.dart';
import 'package:our_clothes_store/core/services/push_notification/firebase_cloud_messaging.dart';
import 'package:our_clothes_store/core/services/push_notification/local_notfication_service.dart';
import 'package:our_clothes_store/core/services/shared_pref/shared_pref.dart';

import 'package:our_clothes_store/our_clothes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // BitlyService().initDeepLinks();

  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyDJTcSw1DP3hTb4isCH4sim1DFiCn1HvJM',
            appId: '1:1003026458129:android:4849282b4144214a8b73b0',
            messagingSenderId: '1003026458129',
            projectId: 'ourclothes-fcdb6',
          ),
        ).whenComplete(() {
          FirebaseCloudMessaging().init();
          LocalNotificationService.init();
        })
      : await Firebase.initializeApp().whenComplete(() {
          FirebaseCloudMessaging().init();
          LocalNotificationService.init();
        });

  Bloc.observer = AppBlocObserver();
  await SharedPref().instantiatePreferences();
  await setupInjector();

  await HiveDatabase().setup();
  await DynamicLink().initDynamicLink();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  runApp(
    DevicePreview(
      builder: (context) => const OurClothes(), // Wrap your app
    ),
  );
}
