import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationCheckout extends StatelessWidget {
  const CustomBottomNavigationCheckout({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      child: MaterialButton(
        onPressed: onPressed,
        color: ColorConstant.secondPuplerDistinct,
        textColor: ColorConstant.whitePrimary,

        child: Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
