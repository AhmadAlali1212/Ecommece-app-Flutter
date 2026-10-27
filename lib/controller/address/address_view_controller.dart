import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/datasource/remote/address_data.dart';
import 'package:ecommeceappcourse/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class AddressViewControllerAbstract extends GetxController {}

class AddressViewController extends AddressViewControllerAbstract {
  StatusRequset statusRequset = StatusRequset.none;
  MyService myService = Get.find();
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  getData() async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await addressData.getData(
      myService.sharedPreference.getString("id")!,
    );
    print("rwa response");
    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequset = StatusRequset.failure;
        }
      } else {
        statusRequset = StatusRequset.serviceFailure;
      }
    } else {
      print("$statusRequset");
    }
    update();
  }

  removeAddress(String addressId) {
    addressData.removeData(addressId);
    data.removeWhere((element) => element.addressId == int.parse(addressId));
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
