import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomMaterialButtonLanguage extends StatelessWidget {
 const CustomMaterialButtonLanguage({
    super.key,
    required this.text,
    required this.onPressed,
  });
 final String text;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      child: MaterialButton(
        minWidth: 250,
        height: 40,
        onPressed: onPressed,
        color: ColorConstant.puplerDistinct,
        textColor: ColorConstant.whitePrimary,
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
