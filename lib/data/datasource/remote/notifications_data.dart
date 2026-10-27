import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class NotificationsData {
  Crud crud;
  NotificationsData(this.crud);
  getData(String userId) async {
    var respons = await crud.postData(AppLink.notifications, {
      "userid": userId,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
