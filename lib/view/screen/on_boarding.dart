import 'package:ecommeceappcourse/controller/on_boarding_controller.dart';
import 'package:ecommeceappcourse/view/widget/onBoarding/custom_pageView_onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [Expanded(flex: 2, child: CustomPageViewOnboarding())],
      ),
    );
  }
}
