import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/data/datasource/remote/chechEmail/verificationCode_email_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AstractVerificationcodeEmailController extends GetxController {
  verificationCodeEmail(String verificationCode) {}
  toResetPassword() {}
}

class VerificationcodeEmailController
    extends AstractVerificationcodeEmailController {
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  String? email;
  StatusRequset statusRequset = StatusRequset.none;
  VerificationCodeEmailData verificationCodeData = VerificationCodeEmailData(
    Get.find(),
  );
  @override
  verificationCodeEmail(String verificationCode) async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await verificationCodeData.postData(
      email!,
      verificationCode,
    );
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword);
      } else {
        Get.defaultDialog(
          title: "warning".tr,
          middleText: "verification_code_invalid".tr,
        );
      }
    } else {
      print("$statusRequset");
    }
    update();
  }

  @override
  toResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  resend() {
    verificationCodeData.reSend(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
