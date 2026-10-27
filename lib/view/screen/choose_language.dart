import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/localization/changed_local.dart';
import 'package:ecommeceappcourse/view/widget/language/custom_material_button_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseLanguage extends GetView<ChangedLocal> {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "choose_language".tr,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          CustomMaterialButtonLanguage(
            text: "arabic".tr,
            onPressed: () {
              controller.changeLang("ar");
              Get.toNamed(AppRoutes.onboarding);
            },
          ),
          SizedBox(height: 2),
          CustomMaterialButtonLanguage(
            text: "english".tr,
            onPressed: () {
              controller.changeLang("en");
              Get.toNamed(AppRoutes.onboarding);
            },
          ),
        ],
      ),
    );
  }
}
