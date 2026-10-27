import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/data/datasource/remote/offers_data.dart';
import 'package:ecommeceappcourse/data/model/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

abstract class OffersControllerAbstract extends SearchControllerMix {
  getItemsOffers();
}

class OffersController extends OffersControllerAbstract {
  OffersData offersData = OffersData(Get.find());
  List listdata2 = [];

  @override
  getItemsOffers() async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await offersData.getData();

    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        listdata2.clear();
        listdata2.addAll(response["data"]);
      } else {
        statusRequset = StatusRequset.failure;
      }

      print("$statusRequset");
    } else {
      listdata2.clear();
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  @override
  void onInit() {
    getItemsOffers();
    search = TextEditingController();
    super.onInit();
  }
}
