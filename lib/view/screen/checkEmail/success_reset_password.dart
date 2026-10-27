import 'package:ecommeceappcourse/controller/checkEmail/success_reset_password_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_material_button_auth.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordController controller = Get.put(
      SuccessResetPasswordController(),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "success_reset_password".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(1),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Icon(
                Icons.check_circle_outline_outlined,
                size: 250,
                color: ColorConstant.puplerDistinct,
              ),
              SizedBox(height: 30),
              CustomTextTitleAndBodyAuth(
                welcom: "success_reset_password".tr,
                intrdouction: "click_okay_to_login".tr,
              ),
              Spacer(flex: 2),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: CustomMaterialButtonAuth(
                  onPressed: () {
                    controller.toLogin();
                  },
                  text: "okay".tr,
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
