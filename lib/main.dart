import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'our_clothes.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDJTcSw1DP3hTb4isCH4sim1DFiCn1HvJM",
              appId: "1:1003026458129:android:4849282b4144214a8b73b0",
              messagingSenderId: "1003026458129",
              projectId: "ourclothes-fcdb6"))
      : await Firebase.initializeApp();

  runApp(
    OurClothes()
  );
}
