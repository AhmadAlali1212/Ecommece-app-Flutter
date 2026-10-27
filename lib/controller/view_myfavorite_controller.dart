import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/view_myfavorite_data.dart';
import 'package:ecommeceappcourse/data/model/view_myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

abstract class ViewMyfavoriteControllerAbstract extends SearchControllerMix {
  getMyfavorite();
  deleltMyfavorite(String favId);
}

class ViewMyfavoriteController extends ViewMyfavoriteControllerAbstract {
  List<ViewMyfavoriteModel> data = [];
  MyService myService = Get.find();

  ViewMyfavoriteData viewMyfavoriteData = ViewMyfavoriteData(Get.find());
  @override
  getMyfavorite() async {
    data.clear();
    statusRequset = StatusRequset.loading;
    var response = await viewMyfavoriteData.getData(
      myService.sharedPreference.getString("id")!,
    );
    print("================Controller: $response");

    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => ViewMyfavoriteModel.fromJson(e)));

        // data.clear();
        // data.addAll(response["data"]);
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      data.clear();
      statusRequset = StatusRequset.failure;
      print("$statusRequset");
    }
    update();
  }

  @override
  deleltMyfavorite(favId) {
    var response = viewMyfavoriteData.deletData(favId);
    data.removeWhere((element) => element.favoriteId == int.parse(favId));
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();

    getMyfavorite();

    super.onInit();
  }
}
