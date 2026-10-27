import 'package:ecommeceappcourse/view/screen/home.dart';
import 'package:ecommeceappcourse/view/screen/notifications.dart';
import 'package:ecommeceappcourse/view/screen/offers.dart';
import 'package:ecommeceappcourse/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenControllerAbstract extends GetxController {
  changedPage(int i);
}

class HomeScreenController extends HomeScreenControllerAbstract {
  List<Widget> homePageList = [
    Home(),
    SettingScreen(),
    Notifications(),
    Offers(),
  ];
  List<IconData> homeScreenIcon = [
    Icons.home,
    Icons.settings,
    Icons.notifications_active_outlined,
    Icons.discount_outlined,
  ];
  List<String> homeScreenTitle = ["Home", "Setting", "Notification", "Profile"];

  int currentPage = 0;
  @override
  changedPage(int i) {
    currentPage = i;
    update();
  }
}
