import 'package:ecommeceappcourse/controller/on_boarding_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/data/datasource/static/on_boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotolistonboarding extends StatelessWidget {
  const CustomDotolistonboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: EdgeInsets.only(right: 5),
              duration: Duration(microseconds: 2000),
              width: controller.currentPage == index ? 20 : 5,
              height: 10,
              decoration: BoxDecoration(
                color: controller.currentPage == index
                    ? ColorConstant.puplerDistinct
                    : ColorConstant.puplerLight,
                borderRadius: BorderRadius.circular(10),
                border: controller.currentPage == index
                    ? Border.all(color: ColorConstant.puplerDistinct, width: 10)
                    : null,
              ),
            ),
          ),
          // SmoothPageIndicator(
          //   controller: controller.pageController,
          //   count: onBoardingList.length,
          //   effect: ExpandingDotsEffect(
          //     dotHeight: 6,
          //     dotWidth: 6,
          //     expansionFactor: 3,
          //     activeDotColor: ColorConstant.puplerLight,
          //     dotColor: ColorConstant.puplerDistinct,
          //   ),
          // ),
        ],
      ),
    );
  }
}
