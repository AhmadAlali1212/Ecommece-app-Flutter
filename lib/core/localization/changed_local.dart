import 'package:ecommeceappcourse/core/constant/app_theme.dart';
import 'package:ecommeceappcourse/core/functions/fcmconfig.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ChangedLocal extends GetxController {
  Locale? language;
  ThemeMode themeMode = ThemeMode.light;
  bool isDarkMode = false;
  ThemeData lightTheme = appThemeEnglish;
  ThemeData darkTheme = appThemeEnglishDark;
  MyService myService = Get.find();

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    language = locale;
    myService.sharedPreference.setString("lang", langCode);
    if (langCode == "ar") {
      lightTheme = appThemeArabic;
      darkTheme = appThemeArabicDark;
    } else {
      lightTheme = appThemeEnglish;
      darkTheme = appThemeEnglishDark;
    }
    Get.updateLocale(locale);
    // update direction for Arabic if needed
    if (langCode == 'ar') {
      Get.forceAppUpdate();
    }
    update();
  }

  changeThemeMode(bool darkMode) {
    isDarkMode = darkMode;
    themeMode = darkMode ? ThemeMode.dark : ThemeMode.light;
    myService.sharedPreference.setString("theme", darkMode ? "dark" : "light");
    Get.changeThemeMode(themeMode);
    update();
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("notification".tr, "location_service_disabled".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("notification".tr, "location_permission_denied".tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
        "notification".tr,
        "location_permission_denied_forever".tr,
      );
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    requsetPermissionNotficiton();
    fcmConfig();
    requestPerLocation();
    String? sharedPreflang = myService.sharedPreference.getString("lang");
    String? savedTheme = myService.sharedPreference.getString("theme");
    isDarkMode = savedTheme == "dark";
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    if (sharedPreflang == "ar") {
      language = const Locale("ar");
      lightTheme = appThemeArabic;
      darkTheme = appThemeArabicDark;
    } else if (sharedPreflang == "en") {
      language = const Locale("en");
      lightTheme = appThemeEnglish;
      darkTheme = appThemeEnglishDark;
    } else {
      language = Locale(Get.deviceLocale?.languageCode ?? "en");
      lightTheme = appThemeEnglish;
      darkTheme = appThemeEnglishDark;
    }

    if (isDarkMode) {
      Get.changeThemeMode(themeMode);
    }
    super.onInit();
  }
}
