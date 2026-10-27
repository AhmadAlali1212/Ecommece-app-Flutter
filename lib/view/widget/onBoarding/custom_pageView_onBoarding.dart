import 'package:ecommeceappcourse/controller/on_boarding_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/data/datasource/static/on_boarding_data.dart';
import 'package:ecommeceappcourse/view/widget/onBoarding/custom_dotoListOnBoarding.dart';
import 'package:ecommeceappcourse/view/widget/onBoarding/custom_materialButton_onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomPageViewOnboarding extends GetView<OnBoardingController> {
  const CustomPageViewOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.changedOnBoarding(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("${onBoardingList[i].image}"),
            fit: BoxFit.cover,
            alignment: AlignmentGeometry.center,
          ),
        ),
        child: Column(
          children: [
            Spacer(flex: 2),
            SizedBox(height: 20),

            onBoardingList[i].title!,

            SizedBox(height: 25),
            Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.greyPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: CustomDotolistonboarding()),
                  CustomMaterialbuttonOnboarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
