import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingCnontrollerAbstract extends GetxController {
  toggleNotificationsEnabled(bool val);
}

class SettingCnontroller extends SettingCnontrollerAbstract {
  MyService myService = MyService();

  bool isNotificationsEnabled = false;
  @override
  toggleNotificationsEnabled(val) {
    isNotificationsEnabled = val;
    if (val) {
      FirebaseMessaging.instance.subscribeToTopic("users");
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
    }
    update();
  }

  List<Widget> get settingList => [
    ListTile(
      onTap: () {
        Get.toNamed(AppRoutes.ordersPending);
      },
      trailing: Icon(Icons.production_quantity_limits_outlined),
      title: Text("orders".tr),
    ),
    ListTile(
      onTap: () {
        Get.toNamed(AppRoutes.archive);
      },
      trailing: Icon(Icons.archive_outlined),
      title: Text("archive".tr),
    ),
    ListTile(
      onTap: () {
        Get.toNamed(AppRoutes.adressView);
      },
      trailing: Icon(Icons.location_on_outlined),
      title: Text("address".tr),
    ),

    ListTile(
      onTap: () {},
      trailing: Icon(Icons.help_outline_outlined),
      title: Text("about".tr),
    ),
    ListTile(
      onTap: () {
        launchUrl(Uri.parse("tel:+0994124214"));
      },
      trailing: Icon(Icons.phone_callback_outlined),
      title: Text("contact_us".tr),
    ),
    ListTile(
      onTap: () {
        String userid = myService.sharedPreference.getString("id")!;
        FirebaseMessaging.instance.unsubscribeFromTopic("users");
        FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
      },
      trailing: Icon(Icons.logout_outlined),
      title: Text("logout".tr),
    ),
  ];
}
