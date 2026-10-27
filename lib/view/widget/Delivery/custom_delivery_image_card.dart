import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomDeliveryImageCard extends StatelessWidget {
  const CustomDeliveryImageCard({
    super.key,
    required this.deliveryType,
    required this.deliveryImage,
    required this.onChooseDelivery,
    required this.isActive,
  });
  final String deliveryType;
  final String deliveryImage;
  final bool isActive;
  final Function()? onChooseDelivery;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChooseDelivery,
      child: Container(
        padding: EdgeInsets.only(right: 16, left: 12, top: 6, bottom: 10),

        height: 120,
        width: 110,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: ColorConstant.ThirdPuplerDistinct,
          ),
          color: isActive == true
              ? ColorConstant.puplerDistinct
              : ColorConstant.whitePrimary,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: Image.asset(
                deliveryImage,
                color: isActive == true
                    ? ColorConstant.whitePrimary
                    : ColorConstant.puplerDistinct,
              ),
            ),
            Text(
              deliveryType,
              style: TextStyle(
                color: isActive == true
                    ? ColorConstant.whitePrimary
                    : ColorConstant.puplerDistinct,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
