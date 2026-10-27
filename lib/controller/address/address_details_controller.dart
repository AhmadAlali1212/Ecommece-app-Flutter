import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AddressDetailsControllerAbstract extends GetxController {}

class AddressDetailsController extends AddressDetailsControllerAbstract {
  StatusRequset statusRequset = StatusRequset.none;
  MyService myService = Get.find();

  String? lat;
  String? long;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? building;
  TextEditingController? name;

  AddressData addressData = AddressData(Get.find());

  AddData() async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await addressData.addData(
      myService.sharedPreference.getString("id")!,
      city!.text,
      street!.text,
      building!.text,
      name!.text,
      lat!,
      long!,
    );
    print("rwa response");
    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      print("$statusRequset");
    }
    update();
  }

  initialData() {
    lat = Get.arguments["lat"];
    long = Get.arguments["long"]!;
  }

  @override
  void onInit() {
    city = TextEditingController();
    street = TextEditingController();
    building = TextEditingController();
    name = TextEditingController();

    initialData();
    super.onInit();
  }
}
