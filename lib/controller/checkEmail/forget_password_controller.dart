import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/data/datasource/remote/chechEmail/forget_password_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AstractForgetPasswordController extends GetxController {
  forgetPassword() {}
  toVerificationCode() {}
}

class ForgetPasswordController extends AstractForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  StatusRequset statusRequset = StatusRequset.none;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  @override
  forgetPassword() {}

  @override
  toVerificationCode() async {
    var fromApp = fromState.currentState;
    if (fromApp!.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      var response = await forgetPasswordData.postData(email.text);
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(
            AppRoutes.verificationEmail,
            arguments: {"email": email.text},
          );
        } else {
          Get.defaultDialog(
            title: "warning".tr,
            middleText: "email_not_exists".tr,
          );
        }
      } else {
        print("$statusRequset");
      }
      update();
    } else {
      print("Not Valid");
    }
    Get.offNamed(AppRoutes.verificationEmail);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
