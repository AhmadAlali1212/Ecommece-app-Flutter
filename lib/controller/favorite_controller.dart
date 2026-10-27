import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoriteControllerAbstract extends GetxController {
  setFavorite(id, val) {}
  favoriteAdd(String itemsId) {}
  favoriteRemove(String itemsId) {}
}

class FavoriteController extends FavoriteControllerAbstract {
  Map isFavorite = {};
  MyService myService = Get.find();
  List data = [];

  StatusRequset statusRequset = StatusRequset.none;
  FavoriteData favoriteData = FavoriteData(Get.find());
  @override
  favoriteAdd(itemsId) async {
    data.clear();
    statusRequset = StatusRequset.loading;
    update();

    var response = await favoriteData.favoriteadd(
      myService.sharedPreference.getString("id")!,
      itemsId,
    );
    print("rwa response");

    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
          title: "notification".tr,
          messageText: Text("product_added_to_favorites".tr),
        );
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  @override
  favoriteRemove(itemsId) async {
    data.clear();

    statusRequset = StatusRequset.loading;

    var response = await favoriteData.favoriteremove(
      myService.sharedPreference.getString("id")!,
      itemsId,
    );
    print(response);
    statusRequset = handdlingData(response);

    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        setFavorite(itemsId, "1");

        Get.rawSnackbar(
          title: "notification".tr,
          messageText: Text("product_removed_from_favorites".tr),
        );
      } else {
        statusRequset = StatusRequset.failure;
      }
    }

    update();
  }

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }
}
