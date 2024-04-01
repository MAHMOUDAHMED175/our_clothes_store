import 'package:flutter/material.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/routes/app_routes.dart';

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image(
                image: AssetImage(
                  context.assets.homeBg!,
                ),
                fit: BoxFit.contain,
              ),
            ),
            TextButton(
                onPressed: () {
                  context.pushName(AppRoutes.two);
                },
                child: Text(
                  'oooooooooooooooooooooooooooone',
                  style: TextStyle(color: context.color.mainColor),
                )),
          ],
        ),
      ),
    );
  }
}
