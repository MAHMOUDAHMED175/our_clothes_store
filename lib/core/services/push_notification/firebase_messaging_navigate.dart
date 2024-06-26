import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:our_clothes_store/core/services/push_notification/local_notfication_service.dart';

class FirebaseMessagingNavigate {
  // forground
  static void forGroundHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  // background
  static void backGroundHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  // terminated
  static void terminatedHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  static Future<void> _navigate(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotificationService.showSimpleNotification(
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        payload: message.data['productId'].toString(),
      );
    }
  }
}
