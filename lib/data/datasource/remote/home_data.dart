import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var respons = await crud.postData(AppLink.home, {});
    return respons.fold((l) => l, (r) => r);
  }

  serach(String search) async {
    var respons = await crud.postData(AppLink.search, {"search": search});
    return respons.fold((l) => l, (r) => r);
  }
}
