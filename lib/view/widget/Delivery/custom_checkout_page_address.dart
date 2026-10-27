import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomCheckoutPageAddress extends StatelessWidget {
  const CustomCheckoutPageAddress({super.key, required this.AddressName});
  final String AddressName;
  @override
  Widget build(BuildContext context) {
    return Text(
      AddressName,
      style: TextStyle(
        color: ColorConstant.puplerDistinct,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
