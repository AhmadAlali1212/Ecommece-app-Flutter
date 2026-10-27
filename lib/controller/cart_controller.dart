import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/cart_data.dart';
import 'package:ecommeceappcourse/data/model/cart_model.dart';
import 'package:ecommeceappcourse/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartControllerAbstract extends GetxController {
  cartAdd(String itemsId) {}
  cartRemove(String itemsId) {}
  cartCount(itemsId) {}
  cartView() {}
}

class CartController extends CartControllerAbstract {
  CouponModel? couponModel;
  int couponDiscount = 0;
  String? couponName;
  String? couponId;

  Map isFavorite = {};
  MyService myService = Get.find();
  List<CartModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;
  CartData cartData = CartData(Get.find());
  int totalCountItem = 0;
  double priceOrders = 0;
  TextEditingController? controllerCouponText;
  @override
  void onInit() {
    controllerCouponText = TextEditingController();
    cartView();
    super.onInit();
  }

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
  cartView() async {
    try {
      statusRequset = StatusRequset.loading;
      update();

      var response = await cartData.cartview(
        myService.sharedPreference.getString("id")!,
      );

      print("============== RESPONSE ==============");
      print(response);

      statusRequset = handdlingData(response);

      print(statusRequset);

      if (statusRequset == StatusRequset.success) {
        if (response["status"] == "success") {
          if (response['datacart']["status"] == "success") {
            List responseData = response['datacart']['data'];

            Map responseDataCountAndPrice = response['dataCountAndPrice'];
            data.clear();

            data.addAll(responseData.map((e) => CartModel.fromJson(e)));

            totalCountItem = int.parse(
              responseDataCountAndPrice['total_count'].toString(),
            );

            priceOrders = double.parse(
              responseDataCountAndPrice['total_price'].toString(),
            );
          }
        }
      }
    } catch (e) {
      print("============== ERROR ==============");
      print(e);
    }

    update();
  }

  getTotalPrice() {
    return priceOrders - (priceOrders * couponDiscount / 100);
  }

  checkCuopon() async {
    statusRequset = StatusRequset.loading;

    var response = await cartData.checkCuopon(controllerCouponText!.text);
    print(response);
    statusRequset = handdlingData(response);

    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        Map<String, dynamic> dataCuopon = response['data'];
        couponModel = CouponModel.fromJson(dataCuopon);
        couponDiscount = couponModel!.couponDiscount!;
        couponId = couponModel!.couponId!.toString();

        couponName = couponModel!.couponName!;
      } else {
        couponDiscount = 0;
        couponName = null;
        Get.snackbar("error".tr, "coupon_invalid".tr);
      }
    }

    update();
  }

  goToCheckout() {
    if (data.isEmpty) {
      return Get.snackbar("notification".tr, "cart_empty".tr);
    }
    Get.toNamed(
      AppRoutes.checkout,
      arguments: {
        "couponId": couponId ?? "0",
        "priceOrder": priceOrders.toString(),
        "coupondiscount": couponDiscount.toString(),
      },
    );
  }

  resetCountAndPrice() {
    totalCountItem = 0;
    priceOrders = 0.0;
    data.clear();
  }

  refreshCountAndPrice() {
    resetCountAndPrice();
    cartView();
  }
}
