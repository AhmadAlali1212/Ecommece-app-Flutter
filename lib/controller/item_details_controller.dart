import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/cart_data.dart';
import 'package:ecommeceappcourse/data/datasource/remote/rating/rating_items_data.dart';
import 'package:ecommeceappcourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemDetailsControllerAbstract extends GetxController {
  cartAdd(String itemsId) {}
  cartRemove(String itemsId) {}
  cartCount(itemsId) {}
  initialData();
}

class ItemDetailsController extends ItemDetailsControllerAbstract {
  MyService myService = Get.find();
  List data = [];
  StatusRequset statusRequset = StatusRequset.none;
  CartData cartData = CartData(Get.find());
  int itemcount = 0;
  ItemsModel? itemsModel;
  RatingItemsData ratingItemsData = RatingItemsData(Get.find());
  @override
  cartAdd(itemsId) async {
    data.clear();
    statusRequset = StatusRequset.loading;
    update();

    var response = await cartData.cartadd(
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
          messageText: Text("product_added_to_cart".tr),
        );
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  @override
  cartRemove(itemsId) async {
    data.clear();

    statusRequset = StatusRequset.loading;

    var response = await cartData.cartremove(
      myService.sharedPreference.getString("id")!,
      itemsId,
    );
    print(response);
    statusRequset = handdlingData(response);

    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
          title: "notification".tr,
          messageText: Text("product_removed_from_cart".tr),
        );
      } else {
        statusRequset = StatusRequset.failure;
      }
    }

    update();
  }

  @override
  cartCount(itemsId) async {
    statusRequset = StatusRequset.loading;
    var response = await cartData.cartcount(
      myService.sharedPreference.getString("id")!,
      itemsId.toString(),
    );
    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        int itemCount = 0;

        itemCount = int.parse(response['data'].toString());
        print("================================");
        print("$itemCount");
        return itemCount;
      } else {
        statusRequset = StatusRequset.failure;
      }
    }

    update();
  }

  @override
  initialData() async {
    statusRequset = StatusRequset.loading;

    itemsModel = Get.arguments["itemsModel"];
    itemcount = await cartCount(itemsModel!.itemsId);
    statusRequset = StatusRequset.success;
    update();
  }

  List subItems = [
    {"name": "Red", "id": "1", "active": true},
    {"name": "Blue", "id": "2", "active": false},
    {"name": "Balck", "id": "3", "active": false},
  ];

  add() {
    cartAdd(itemsModel!.itemsId.toString());
    itemcount++;
    update();
  }

  remove() {
    if (itemcount > 0) {
      cartRemove(itemsModel!.itemsId.toString());

      itemcount--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  submitRatingItems(String starnumber, [String comment = ""]) async {
    var userid = myService.sharedPreference.getString("id");
    if (userid == null) {
      Get.rawSnackbar(title: 'error'.tr, messageText: Text('not_logged_in'.tr));
      return;
    }

    statusRequset = StatusRequset.loading;
    update();

    var response = await ratingItemsData.rateItem(
      userid,
      itemsModel!.itemsId.toString(),
      starnumber,
    );

    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
          title: 'notification'.tr,
          messageText: Text('rating_submitted'.tr),
        );
        // If backend returns updated totals, update model
        if (response.containsKey('total_rating')) {
          itemsModel!.totalRating =
              int.tryParse(response['total_rating'].toString()) ??
              itemsModel!.totalRating;
        }
        if (response.containsKey('rating_count')) {
          itemsModel!.ratingCount =
              int.tryParse(response['rating_count'].toString()) ??
              itemsModel!.ratingCount;
        }
        itemsModel!.userRating = int.tryParse(starnumber);
        itemsModel!.isRated = 1;
      } else {
        statusRequset = StatusRequset.failure;
      }
    }

    update();
  }
}
