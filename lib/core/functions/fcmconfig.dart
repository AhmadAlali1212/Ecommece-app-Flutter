import 'package:ecommeceappcourse/controller/orders/orders_pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

requsetPermissionNotficiton() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
}

fcmConfig() {
  print("hi=========================================================");
  FirebaseMessaging.onMessage.listen((message) {
    print("==================Notification===========================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshOrderPage(message.data);
  });
}

refreshOrderPage(data) {
  print("=====================Refresh Order Page:");
  print(data["pageid"]);
  print(data["pagename"]);
  print(Get.currentRoute);
  if (data["pagename"] == "refreshOrderPage" &&
      Get.currentRoute == "/ordersPending") {
    OrdersPendingController controller = Get.find();
    controller.refreshOrderStatus();
  }
}
