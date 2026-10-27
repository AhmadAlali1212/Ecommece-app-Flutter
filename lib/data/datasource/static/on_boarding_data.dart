import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/constant/image_assest.dart';
import 'package:ecommeceappcourse/data/model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: ImageAssest.onBoardingImageOne,
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: ColorConstant.puplerLight,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),

        children: <TextSpan>[
          TextSpan(text: "choose_the".tr),
          TextSpan(
            text: "product".tr,
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),

    // title: "Choose \n The ${Text("Prooduct")}",
    body: "onboarding_body_one".tr,
  ),
  OnBoardingModel(
    image: ImageAssest.onBoardingImageTwo,
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: ColorConstant.puplerLight,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(text: "add_favourite\n".tr),
          TextSpan(
            text: "cart".tr,
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    // title: "Add favourite \n Product to ${Text("Cart")}",
    body: "onboarding_body_two".tr,
  ),
  OnBoardingModel(
    image: ImageAssest.onBoardingImageThree,
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: ColorConstant.puplerLight,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(text: "choose_your".tr),
          TextSpan(
            text: "payment".tr,
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: " option".tr,
            style: TextStyle(
              color: ColorConstant.puplerLight,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    // title: "Choose Your\n ${Text("Payment")} Option",
    body: "onboarding_body_three".tr,
  ),
  OnBoardingModel(
    image: ImageAssest.onBoardingImageFour,
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: ColorConstant.puplerLight,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(text: "choose_the_best".tr),
          TextSpan(
            text: "shopping".tr,
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    //   title: "Choose The Best\n ${Text("Shopping")}",
    body: "onboarding_body_four".tr,
  ),
];
