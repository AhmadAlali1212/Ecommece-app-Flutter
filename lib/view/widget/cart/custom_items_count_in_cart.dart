import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomItemsCountInCart extends StatelessWidget {
  final  String title;

 const CustomItemsCountInCart({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13),
      height: 35,
      decoration: BoxDecoration(
        color: ColorConstant.puplerLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 247, 244, 244),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
