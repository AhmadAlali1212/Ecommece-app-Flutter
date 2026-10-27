import 'package:ecommeceappcourse/controller/auth/success_signUp_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_material_button_auth.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignupController controller = Get.put(SuccessSignupController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "success_sign_up".tr,
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
                welcom: "success_sign_up".tr,
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
