import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomShippingAddressCard extends StatelessWidget {
  const CustomShippingAddressCard({
    super.key,
    required this.AddressName,
    required this.AddressDetails,
    required this.isActive,
    required this.onShippingAddress,
  });
  final String AddressName;
  final String AddressDetails;
  final bool isActive;
  final Function()? onShippingAddress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onShippingAddress,
      child: Card(
        color: isActive == true
            ? ColorConstant.puplerDistinct
            : ColorConstant.whitePrimary,
        child: ListTile(
          title: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              AddressName,
              style: TextStyle(
                color: isActive == true
                    ? ColorConstant.whitePrimary
                    : ColorConstant.blackPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Container(
            padding: EdgeInsets.only(bottom: 4),

            child: Text(
              AddressDetails,
              style: TextStyle(
                color: isActive == true
                    ? ColorConstant.whitePrimary
                    : ColorConstant.blackPrimary,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
