import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/notifications_data.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

abstract class NotificatonsControllerAbstract extends SearchControllerMix {
  getNotificatons();
}

class NotificatonsController extends NotificatonsControllerAbstract {
  List data = [];
  @override
  StatusRequset statusRequset = StatusRequset.none;
  NotificationsData notificationsData = NotificationsData(Get.find());
  MyService myService = Get.find();

  @override
  getNotificatons() async {
    statusRequset = StatusRequset.loading;
    update();

    var response = await notificationsData.getData(
      myService.sharedPreference.getString("id")!,
    );

    print("================ControllerSearch: $response");
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        data = response['data'];
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  @override
  void onInit() {
    getNotificatons();
    super.onInit();
  }
}
