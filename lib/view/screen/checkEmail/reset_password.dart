import 'package:ecommeceappcourse/controller/checkEmail/reset_password_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/functions/validator_auth.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_material_button_auth.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/cuustom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "reset_password".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      body: GetBuilder<ResetPasswordController>(
        builder: (controller) => HandlindDataView(
          statusRequset: controller.statusRequset,
          widget: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: controller.fromState,
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  CustomTextTitleAndBodyAuth(
                    welcom: "new_password".tr,
                    intrdouction: "please_enter_new_password".tr,
                  ),
                  SizedBox(height: 30),
                  CuustomTextFormField(
                    validator: (val) {
                      validator(val!, 8, 100, "password");
                      return null;
                    },
                    isNumber: false,
                    mycontroller: controller.password,
                    labelName: "password".tr,
                    hint: "enter_new_password".tr,
                    iconData: Icons.password_outlined,
                  ),
                  SizedBox(height: 20),
                  CuustomTextFormField(
                    validator: (val) {
                      validator(val!, 8, 100, "password");
                      return null;
                    },
                    isNumber: false,
                    mycontroller: controller.repairPassword,
                    labelName: "repair_password".tr,
                    hint: "enter_new_password_again".tr,
                    iconData: Icons.password_outlined,
                  ),
                  SizedBox(height: 20),
                  CustomMaterialButtonAuth(
                    onPressed: () {
                      controller.toSuccessResetPassword();
                    },
                    text: "save".tr,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
