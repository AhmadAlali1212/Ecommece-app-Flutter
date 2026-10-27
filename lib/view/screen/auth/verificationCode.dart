import 'package:ecommeceappcourse/controller/auth/verificationCode_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verificationcode extends StatelessWidget {
  const Verificationcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "verification".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      body: GetBuilder<VerificationCodeController>(
        builder: (controller) => HandlindDataView(
          statusRequset: controller.statusRequset,
          widget: Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                SizedBox(height: 30),
                CustomTextTitleAndBodyAuth(
                  welcom: "verification_code".tr,
                  intrdouction: "please_enter_verification_code".tr,
                ),
                SizedBox(height: 30),
                OtpTextField(
                  borderRadius: BorderRadius.circular(30),
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.verificationCode(verificationCode);
                  }, // end onSubmit
                ),

                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    controller.resend();
                  },
                  child: Text(
                    "resend_verification_code".tr,
                    style: TextStyle(color: ColorConstant.puplerDistinct),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
