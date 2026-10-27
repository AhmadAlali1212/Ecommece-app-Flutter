import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsComtrollerAbstract extends SearchControllerMix {
  initialData();
  getItems(String? catId);
  changeCat(int theCat, String categoriesId);
}

class ItemsComtroller extends ItemsComtrollerAbstract {
  List categories = [];
  List data = [];
  MyService myService = Get.find();
  String deliveryTime = "";
  int? selectedItem;
  String? catId;
  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedItem = Get.arguments['items'];
    catId = Get.arguments['categoryId'];

    getItems(catId);
  }

  @override
  changeCat(theCat, categoriesId) {
    selectedItem = theCat;
    catId = categoriesId;

    getItems(catId);

    update();
  }

  @override
  StatusRequset statusRequset = StatusRequset.none;
  ItemsData itemsData = ItemsData(Get.find());
  @override
  getItems(catId) async {
    statusRequset = StatusRequset.loading;
    update();

    var response = await itemsData.getData(
      catId!,
      myService.sharedPreference.getString("id")!,
    );

    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        data.clear();
        data.addAll(response["data"]);
        deliveryTime = myService.sharedPreference.getString("deliveryTime")!;
      } else {
        statusRequset = StatusRequset.failure;
      }

      print("$statusRequset");
    } else {
      data.clear();
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  @override
  void onInit() {
    search = TextEditingController();

    initialData();
    super.onInit();
  }
}
