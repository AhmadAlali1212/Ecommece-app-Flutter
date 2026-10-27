import 'package:ecommeceappcourse/controller/address/address_view_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(title: Text("address_view".tr)),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            Get.toNamed(AppRoutes.adressAdd);
          },

          icon: Icon(Icons.add, color: ColorConstant.whitePrimary),
          color: ColorConstant.puplerDistinct,
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),

        child: GetBuilder<AddressViewController>(
          builder: (controller) => HandlindDataView(
            statusRequset: controller.statusRequset,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CustomAddressViewCard(
                  addressModel: controller.data[index],
                  onRemove: () {
                    controller.removeAddress(
                      controller.data[index].addressId.toString(),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAddressViewCard extends StatelessWidget {
  CustomAddressViewCard({
    super.key,
    required this.addressModel,
    required this.onRemove,
  });
  AddressModel addressModel;
  void Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Container(
            padding: EdgeInsets.all(6),
            child: Text(
              addressModel.addressName!,
              style: TextStyle(
                color: ColorConstant.blackPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Container(
            padding: EdgeInsets.all(6),

            child: Text(
              "${addressModel.addressCity!}  ${addressModel.addressStreet!}  ${addressModel.addressBuilding!}",
              style: TextStyle(fontSize: 16),
            ),
          ),
          trailing: IconButton(
            onPressed: onRemove,
            icon: Icon(Icons.delete_outline),
          ),
        ),
      ),
    );
  }
}
