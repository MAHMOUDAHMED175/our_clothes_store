import 'package:flutter/material.dart';
import 'package:our_clothes_store/core/app/env.variable.dart';

class OurClothes extends StatelessWidget {
  const OurClothes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OurClothes',
      debugShowCheckedModeBanner: EnvVaiable.instance.debugmod,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(appBar: AppBar(title: const Icon(Icons.reddit)),),
    );
  }

 
 }
