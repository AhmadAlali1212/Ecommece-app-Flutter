import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequset statusRequset;
  getData() async {
    statusRequset = StatusRequset.loading;
    var response = await testData.getData();
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      data = response;
    } else {
      print("$statusRequset");
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
