import 'package:ecommeceappcourse/controller/cart_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomButtonForPrice extends GetView<CartController> {
  const CustomBottomButtonForPrice({
    super.key,
    required this.price,
    required this.discount,
    required this.totalPrice,
    required this.controllerCouponText,
    required this.onApplayCoupon,
    required this.shipping,
  });
  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
  final TextEditingController controllerCouponText;
  final void Function()? onApplayCoupon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
      height: 400,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponName == null
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: controllerCouponText,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 10,
                            ),
                            hintText: "coupon_code".tr,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: onApplayCoupon,
                          minWidth: 50,
                          color: ColorConstant.secondPuplerDistinct,
                          child: Text(
                            "apply".tr,
                            style: TextStyle(
                              color: ColorConstant.whitePrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(
                    "coupon_code".trArgs([controller.couponName!]),
                    style: TextStyle(color: ColorConstant.puplerDistinct),
                  ),
          ),
          SizedBox(height: 4),
          SizedBox(
            height: 200,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: ColorConstant.colorSecondMain,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "price".tr,
                        style: TextStyle(
                          color: ColorConstant.puplerDistinct,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(price),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "delivery_fee".tr,
                        style: TextStyle(
                          color: ColorConstant.puplerDistinct,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(discount),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "shipping".tr,
                        style: TextStyle(
                          color: ColorConstant.puplerDistinct,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(shipping),
                    ],
                  ),
                  SizedBox(height: 7),
                  Divider(),
                  SizedBox(height: 7),

                  Row(
                    children: [
                      Text(
                        "total_price".tr,
                        style: TextStyle(
                          color: ColorConstant.puplerDistinct,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(totalPrice),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            height: 44,
            minWidth: 400,
            color: ColorConstant.puplerDistinct,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            onPressed: () {
              controller.goToCheckout();
            },
            child: Text(
              "place_order".tr,
              style: TextStyle(
                color: const Color.fromARGB(255, 232, 226, 226),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
