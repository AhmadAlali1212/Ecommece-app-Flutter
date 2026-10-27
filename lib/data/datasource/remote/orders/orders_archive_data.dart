import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getOrders(String userid) async {
    var respons = await crud.postData(AppLink.archive, {"userid": userid});
    return respons.fold((l) => l, (r) => r);
  }

  ratingOrders(String orderid, String rating, String ratingcommet) async {
    var respons = await crud.postData(AppLink.ratingOrder, {
      "orderid": orderid,
      "rating": rating,
      "ratingcommet": ratingcommet,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
