import 'package:flutter/material.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/routes/app_routes.dart';

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
                            context.pushName(AppRoutes.two);

            },
            child: const Text('oooooooooooooooooooooooooooone')),
      ),
    );
  }
}
