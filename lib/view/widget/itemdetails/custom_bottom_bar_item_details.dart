import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomBottomBarItemDetails extends StatelessWidget {
  const CustomBottomBarItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: 80,
      child: MaterialButton(
        color: ColorConstant.puplerDistinct,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        onPressed: () {
          Get.toNamed(AppRoutes.cartScreen);
        },
        child: Text(
          "Go To Cart",
          style: TextStyle(
            color: ColorConstant.colorSecondMain,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
