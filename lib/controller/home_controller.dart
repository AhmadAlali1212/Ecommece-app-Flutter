import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/home_data.dart';
import 'package:ecommeceappcourse/data/model/items_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeControllerAbstract extends SearchControllerMix {
  initialData();
  goToItems(List categories, int selectedItem, String catId);
}

class HomeController extends HomeControllerAbstract {
  MyService myService = Get.find();
  String? id;
  String? username;
  List categories = [];
  List items = [];
  List settingData = [];
  String titleHomeCard = "";
  String bodyHomeCard = "";
  String deliveryTime = "";
  String? lang;
  getData() async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await homeData.getData();
    print("================Controller: $response");

    statusRequset = handdlingData(response);
    print("================statusRequset: $statusRequset");

    if (statusRequset == StatusRequset.success) {
      if (response['status'] == "success") {
        categories.clear();
        settingData.addAll(response["setting"]['data']);
        categories.addAll(response["categories"]['data']);
        items.addAll(response["items"]['data']);
        titleHomeCard = settingData[0]['setting_titlehome'];
        bodyHomeCard = settingData[0]['setting_bodyhome'];
        deliveryTime = settingData[0]['setting_deliverytime'].toString();
        myService.sharedPreference.setString("deliveryTime", deliveryTime);
      }
    } else {
      statusRequset = StatusRequset.failure;
      print("$statusRequset");
    }
    update();
  }

  @override
  initialData() {
    lang = myService.sharedPreference.getString("lang");
    id = myService.sharedPreference.getString("id");
    username = myService.sharedPreference.getString("username");
  }

  @override
  goToItems(categories, selectedItem, catId) {
    Get.toNamed(
      AppRoutes.itemsScreen,
      arguments: {
        "categories": categories,
        "items": selectedItem,
        "categoryId": catId,
      },
    );
  }

  @override
  onInit() async {
    search = TextEditingController();
    FirebaseMessaging.instance.subscribeToTopic("users");
    initialData();
    getData();
    super.onInit();
  }
}

class SearchControllerMix extends GetxController {
  List<ItemsModel> listData = [];
  HomeData homeData = HomeData(Get.find());
  StatusRequset statusRequset = StatusRequset.none;
  TextEditingController? search;

  bool isSearch = false;
  ckechSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    searchData();

    update();
  }

  searchData() async {
    statusRequset = StatusRequset.loading;
    var response = await homeData.serach(search!.text);
    print("================ControllerSearch: $response");

    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      }
    } else {
      statusRequset = StatusRequset.failure;
      print("$statusRequset");
    }
    update();
  }

  goToItemDetails(itemModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {"itemsModel": itemModel});
  }
}
