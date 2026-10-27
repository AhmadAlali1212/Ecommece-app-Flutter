import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/orders/orders_archive_data.dart';
import 'package:ecommeceappcourse/data/model/orders_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class OrdersArchiveControllerAbstract extends GetxController {
  printPaymentMethod(String val);
  printDeliveryType(String val);
  printOrderStatus(String val);
  getOrders();
}

class OrdersArchiveController extends OrdersArchiveControllerAbstract {
  MyService myService = Get.find();
  List<OrdersModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());
  @override
  printDeliveryType(val) {
    if (val == '0') {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  @override
  printPaymentMethod(val) {
    if (val == '0') {
      return "Cach On Delivery";
    } else {
      return "Payment Card";
    }
  }

  @override
  printOrderStatus(val) {
    if (val == '0') {
      return "A waitting Approval";
    } else if (val == "1") {
      return "The Order is being Prepared";
    } else if (val == "2") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  getOrders() async {
    statusRequset = StatusRequset.loading;
    update();

    var response = await ordersArchiveData.getOrders(
      myService.sharedPreference.getString("id")!,
    );

    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  submitRatingOrders(String orderid, String rating, String ratincommet) async {
    statusRequset = StatusRequset.loading;
    update();

    var response = await ordersArchiveData.ratingOrders(
      orderid,
      rating,
      ratincommet,
    );
    print("===========================Response: ");

    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        data.clear();
        getOrders();
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  refreshOrderStatus() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
