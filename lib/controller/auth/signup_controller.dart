import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AstractSignUpController extends GetxController {
  signUp() {}
  toLogin() {}
  showPassword() {}
}

class SignUpController extends AstractSignUpController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late bool isPassWordShow = false;
  SignUpData signUpData = SignUpData(Get.find());
  StatusRequset statusRequset = StatusRequset.none;
  List data = [];
  GlobalKey<FormState> fromState2 = GlobalKey<FormState>();
  @override
  showPassword() {
    isPassWordShow = !isPassWordShow;
    update();
  }

  @override
  signUp() async {
    var fromApp = fromState2.currentState;
    if (fromApp!.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      var response = await signUpData.postData(
        name.text,
        email.text,
        phone.text,
        password.text,
      );
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success) {
        if (response['status'] == "success") {
          //      data.addAll(response['data']);
          Get.offNamed(
            AppRoutes.verificationCode,
            arguments: {"email": email.text},
          );
          onDelete();
        } else {
          Get.defaultDialog(
            title: "warning".tr,
            middleText: "phone_or_email_exists".tr,
          );
        }
      } else {
        print("The Failure: $response");
        print("$statusRequset");
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  toLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
