import 'package:get/get.dart';

validator(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not_valid_username".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not_valid_email".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not_valid_phone".tr;
    }
  }

  if (val.isEmpty) {
    return "value_cant_be_empty".tr;
  }
  if (val.length < min) {
    return "value_cant_be_less_than".trArgs([min.toString()]);
  }
  if (val.length > max) {
    return "value_cant_be_greater_than".trArgs([max.toString()]);
  }
}
