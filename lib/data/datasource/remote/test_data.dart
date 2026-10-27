import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var respons = await crud.postData(AppLink.test, {});
    return respons.fold((l) => l, (r) => r);
  }
}
