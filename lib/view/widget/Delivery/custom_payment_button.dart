import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomPaymentButton extends StatelessWidget {
  const CustomPaymentButton({
    super.key,
    required this.paymentType,
    required this.isActive,
    required this.onPayment,
  });
  final String paymentType;
  final bool isActive;
  final Function()? onPayment;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPayment,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: isActive == true
              ? ColorConstant.puplerDistinct
              : const Color.fromARGB(255, 208, 201, 245),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          paymentType,
          style: TextStyle(
            color: isActive == true
                ? ColorConstant.whitePrimary
                : ColorConstant.puplerDistinct,
          ),
        ),
      ),
    );
  }
}
