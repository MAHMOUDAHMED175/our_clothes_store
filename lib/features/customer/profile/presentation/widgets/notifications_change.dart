import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/common/widgets/text_app.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';
import 'package:our_clothes_store/core/services/push_notification/firebase_cloud_messaging.dart';
import 'package:our_clothes_store/core/style/fonts/font_weight_helper.dart';

class NotificationsChange extends StatelessWidget {
  const NotificationsChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications_active,
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.notifications),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),

        // radio buttons
        ValueListenableBuilder(
          valueListenable: FirebaseCloudMessaging().isNotificationSubscribe,
          builder: (_, value, __) {
            return Transform.scale(
              scale: 0.75,
              child: Switch.adaptive(
                value: value,
                inactiveTrackColor: const Color(0xff262626),
                activeColor: Colors.green,
                onChanged: (value)async {
                  FirebaseCloudMessaging().controllerForUserSubscribe(context);
                  print("FirebaseMessaging.instance.getToken()========================>>>>>>>");
                  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? token = await messaging.getToken();
  print('Token: $token');
}
              ),
            );
          },
        ),
      ],
    );
  }
}
