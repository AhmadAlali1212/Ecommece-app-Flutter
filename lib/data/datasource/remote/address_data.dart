import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(String userid) async {
    var respons = await crud.postData(AppLink.addressView, {"userid": userid});
    return respons.fold((l) => l, (r) => r);
  }

  addData(
    String userid,
    String city,
    String street,
    String building,
    String name,
    String lat,
    String long,
  ) async {
    var respons = await crud.postData(AppLink.addressAdd, {
      "userid": userid,
      "city": city,
      "street": street,
      "building": building,
      "name": name,
      "lat": lat,
      "long": long,
    });
    return respons.fold((l) => l, (r) => r);
  }

  removeData(String addressId) async {
    var respons = await crud.postData(AppLink.addressRemove, {
      "addressid": addressId,
    });
    return respons.fold((l) => l, (r) => r);
  }

  editData(String userid, String city, String street, String building) async {
    var respons = await crud.postData(AppLink.addressEdit, {
      "userid": userid,
      "city": city,
      "street": street,
      "building": building,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
