import 'package:ecommeceappcourse/controller/auth/signup_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/functions/exit_alert.dart';
import 'package:ecommeceappcourse/core/functions/validator_auth.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_do_have_account.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_material_button_auth.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/cuustom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "signup".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, t) {
          if (didPop) return;
          exitAlret();
        },
        child: GetBuilder<SignUpController>(
          builder: (controller) => HandlindDataView(
            statusRequset: controller.statusRequset,
            widget: Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: controller.fromState2,
                child: ListView(
                  children: [
                    SizedBox(height: 30),
                    CustomTextTitleAndBodyAuth(
                      welcom: "welcome".tr,
                      intrdouction: "signup_intro".tr,
                    ),
                    SizedBox(height: 30),

                    CuustomTextFormField(
                      validator: (val) {
                        return validator(val!, 5, 100, "username");
                      },
                      isNumber: false,
                      mycontroller: controller.name,
                      labelName: "name".tr,
                      hint: "enter_your_name".tr,
                      iconData: Icons.person_outline,
                    ),
                    SizedBox(height: 20),
                    CuustomTextFormField(
                      validator: (val) {
                        return validator(val!, 10, 100, "email");
                      },
                      isNumber: false,
                      mycontroller: controller.email,
                      labelName: "email".tr,
                      hint: "enter_your_email".tr,
                      iconData: Icons.email_outlined,
                    ),
                    SizedBox(height: 20),
                    CuustomTextFormField(
                      validator: (val) {
                        return validator(val!, 8, 10, "phone");
                      },
                      isNumber: true,
                      mycontroller: controller.phone,
                      labelName: "phone".tr,
                      hint: "enter_your_phone".tr,
                      iconData: Icons.phone_android_outlined,
                    ),
                    SizedBox(height: 20),
                    GetBuilder<SignUpController>(
                      builder: (controller) {
                        return CuustomTextFormField(
                          validator: (val) {
                            return validator(val!, 8, 100, "password");
                          },
                          obscureText: controller.isPassWordShow,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          mycontroller: controller.password,
                          labelName: "password".tr,
                          hint: "enter_your_password".tr,
                          iconData: Icons.lock_outline,
                        );
                      },
                    ),

                    SizedBox(height: 40),
                    CustomMaterialButtonAuth(
                      onPressed: () {
                        controller.signUp();
                      },
                      text: "signup".tr,
                    ),
                    SizedBox(height: 30),
                    CustomDoHaveAccount(
                      onTap: () {
                        controller.toLogin();
                      },
                      text1: "dont_have_account".tr,
                      text2: "login".tr,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
