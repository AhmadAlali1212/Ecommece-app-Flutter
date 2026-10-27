import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getOrders(String userid) async {
    var respons = await crud.postData(AppLink.ordersPending, {
      "userid": userid,
    });
    return respons.fold((l) => l, (r) => r);
  }

  delete(String orderid) async {
    var respons = await crud.postData(AppLink.delete, {"orderid": orderid});
    return respons.fold((l) => l, (r) => r);
  }
}
