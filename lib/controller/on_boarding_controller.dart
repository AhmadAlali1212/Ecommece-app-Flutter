import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/static/on_boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractOnBoardingController extends GetxController {
  next() {}
  changedOnBoarding(int index) {}
}

class OnBoardingController extends AbstractOnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyService myService = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myService.sharedPreference.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    }
    pageController.animateToPage(
      currentPage,
      duration: Duration(microseconds: 2000),
      curve: Curves.easeInOut,
    );
  }

  @override
  changedOnBoarding(index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
