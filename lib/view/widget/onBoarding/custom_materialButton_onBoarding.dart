import 'package:ecommeceappcourse/controller/on_boarding_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMaterialbuttonOnboarding extends GetView<OnBoardingController> {
  const CustomMaterialbuttonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.only(bottom: 100),
      height: 40,
      width: 300,
      child: InkWell(
        onTap: () {
          controller.next();
        },
        child: GetBuilder<OnBoardingController>(
          builder: (controller) {
            return Text(
              controller.currentPage == 0
                  ? "swipe_to_continue".tr
                  : "create_account".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.puplerDistinct,
                fontSize: 16,
              ),
            );
          },
        ),
      ),
    );
  }
}
