import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/address_data.dart';
import 'package:ecommeceappcourse/data/datasource/remote/checkout_data.dart';
import 'package:ecommeceappcourse/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class CheckoutControllerAbstract extends GetxController {
  choosePaymentMethod(String val) {}
  chooseDeliveryType(String val) {}
  chooseAddressId(String val) {}
}

class CheckoutController extends CheckoutControllerAbstract {
  String? paymentMethod;
  String? deliveryType;
  String? addressId = "0";
  late String couponId;
  late String priceOrder;
  late String coupondiscount;
  @override
  choosePaymentMethod(val) {
    paymentMethod = val;
    update();
  }

  @override
  chooseDeliveryType(val) {
    deliveryType = val;
    update();
  }

  @override
  chooseAddressId(val) {
    addressId = val;
    update();
  }

  StatusRequset statusRequset = StatusRequset.none;
  MyService myService = Get.find();
  CheckoutData checkoutData = CheckoutData(Get.find());

  AddressData addressData = AddressData(Get.find());
  List<AddressModel> dataAddress = [];
  getShippingAddress() async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await addressData.getData(
      myService.sharedPreference.getString("id")!,
    );

    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        List dataList = response['data'];
        dataAddress.addAll(dataList.map((e) => AddressModel.fromJson(e)));
        addressId = dataAddress[0].addressId.toString();
      } else {
        statusRequset = StatusRequset.serviceFailure;
      }
    } else {
      print("$statusRequset");
    }
    update();
  }

  checkout() async {
    if (deliveryType == null) {
      Get.snackbar("note".tr, "checkout_delivery_required".tr);
    }

    if (paymentMethod == null) {
      Get.snackbar("note".tr, "checkout_payment_required".tr);
    }
    statusRequset = StatusRequset.loading;
    if (dataAddress.isEmpty) {
      Get.snackbar("note".tr, "checkout_address_required".tr);
    }
    update();
    Map checkoutMap = {
      "userid": myService.sharedPreference.getString("id"),
      "addressid": addressId,
      "ordertype": deliveryType,
      "orderprice": priceOrder,
      "orderpricedelivery": "200",
      "ordercouponid": couponId,
      "orderpayment": paymentMethod,
      "coupondiscount": coupondiscount,
    };
    var response = await checkoutData.checkout(checkoutMap);
    print("============== RESPONSE ==============");
    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.home);
        Get.snackbar("note".tr, "checkout_success".tr);
      } else {
        statusRequset == StatusRequset.none;
        Get.snackbar("error".tr, "checkout_failed".tr);
      }
      update();
    }
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    priceOrder = Get.arguments['priceOrder'];
    coupondiscount = Get.arguments['coupondiscount'].toString();
    getShippingAddress();
    super.onInit();
  }
}
