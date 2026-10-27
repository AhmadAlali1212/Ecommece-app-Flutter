import 'package:ecommeceappcourse/controller/address/address_details_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/shared/custom_material_button.dart';
import 'package:ecommeceappcourse/view/widget/authwidget/cuustom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetiails extends StatelessWidget {
  const AddressDetiails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressDetailsController controller = Get.put(AddressDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text("address_details".tr)),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: GetBuilder<AddressDetailsController>(
          builder: (controller) => HandlindDataView(
            statusRequset: controller.statusRequset,
            widget: ListView(
              children: [
                CuustomTextFormField(
                  labelName: "city".tr,
                  iconData: Icons.location_city_outlined,
                  hint: "enter_city_address".tr,
                  validator: (val) {
                    return null;
                  },
                  isNumber: false,
                  mycontroller: controller.city,
                ),
                SizedBox(height: 10),
                CuustomTextFormField(
                  labelName: "street".tr,
                  iconData: Icons.streetview_outlined,
                  hint: "enter_street_address".tr,
                  validator: (val) {
                    return null;
                  },
                  isNumber: false,
                  mycontroller: controller.street,
                ),

                SizedBox(height: 10),

                CuustomTextFormField(
                  labelName: "building".tr,
                  iconData: Icons.streetview_outlined,
                  hint: "enter_building_address".tr,
                  validator: (val) {
                    return null;
                  },
                  isNumber: false,
                  mycontroller: controller.building,
                ),
                SizedBox(height: 10),
                CuustomTextFormField(
                  labelName: "name".tr,
                  iconData: Icons.message_outlined,
                  hint: "enter_name_address".tr,
                  validator: (val) {
                    return null;
                  },
                  isNumber: false,
                  mycontroller: controller.name,
                ),
                SizedBox(height: 15),
                CustomMaterialButton(
                  onPressed: () {
                    controller.AddData();
                  },
                  text: "add".tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
