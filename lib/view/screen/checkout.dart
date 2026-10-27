import 'package:ecommeceappcourse/controller/orders/checkout_controller.dart';
import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/constant/image_assest.dart';
import 'package:ecommeceappcourse/view/widget/Delivery/custom_bottom_navigation_checkout.dart';
import 'package:ecommeceappcourse/view/widget/Delivery/custom_checkout_page_address.dart';
import 'package:ecommeceappcourse/view/widget/Delivery/custom_delivery_image_card.dart';
import 'package:ecommeceappcourse/view/widget/Delivery/custom_payment_button.dart';
import 'package:ecommeceappcourse/view/widget/Delivery/custom_shipping_address_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationCheckout(
        onPressed: () {
          controller.checkout();
        },
      ),
      backgroundColor: ColorConstant.whitePrimary,
      appBar: AppBar(title: Text("checkout".tr)),
      body: Container(
        padding: EdgeInsets.all(13),
        child: GetBuilder<CheckoutController>(
          builder: (controller) => ListView(
            children: [
              SizedBox(height: 10),
              CustomCheckoutPageAddress(
                AddressName: "choose_payment_method".tr,
              ),

              SizedBox(height: 10),
              CustomPaymentButton(
                onPayment: () {
                  controller.choosePaymentMethod("0");
                },
                paymentType: "cash".tr,
                isActive: controller.paymentMethod == "0" ? true : false,
              ),
              SizedBox(height: 6),
              CustomPaymentButton(
                onPayment: () {
                  controller.choosePaymentMethod("1");
                },
                paymentType: "payment_card".tr,
                isActive: controller.paymentMethod == "1" ? true : false,
              ),

              SizedBox(height: 30),
              CustomCheckoutPageAddress(AddressName: "choose_delivery_type".tr),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomDeliveryImageCard(
                    onChooseDelivery: () {
                      controller.chooseDeliveryType("0");
                    },
                    deliveryType: "delivery".tr,
                    deliveryImage: ImageAssest.delivery,
                    isActive: controller.deliveryType == "0" ? true : false,
                  ),
                  SizedBox(width: 6),
                  CustomDeliveryImageCard(
                    onChooseDelivery: () {
                      controller.chooseDeliveryType("1");
                    },
                    deliveryType: "drive_thru".tr,
                    deliveryImage: ImageAssest.driveThru,
                    isActive: controller.deliveryType == "1" ? true : false,
                  ),
                ],
              ),
              SizedBox(height: 30),

              controller.deliveryType == "0"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCheckoutPageAddress(
                          AddressName: "shipping_address".tr,
                        ),
                        SizedBox(height: 10),
                        if (controller.dataAddress.isEmpty)
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.adressAdd);
                            },
                            child: Center(
                              child: Text(
                                "add_address_to_deliver".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstant.greyPrimary,
                                ),
                              ),
                            ),
                          ),

                        ...List.generate(controller.dataAddress.length, (
                          index,
                        ) {
                          return CustomShippingAddressCard(
                            onShippingAddress: () {
                              controller.chooseAddressId(
                                controller.dataAddress[index].addressId
                                    .toString(),
                              );
                            },
                            AddressName:
                                controller.dataAddress[index].addressName!,
                            AddressDetails:
                                "${controller.dataAddress[index].addressCity!} ${controller.dataAddress[index].addressStreet!}  ${controller.dataAddress[index].addressBuilding!}",
                            isActive:
                                controller.addressId ==
                                    controller.dataAddress[index].addressId
                                        .toString()
                                ? true
                                : false,
                          );
                        }),

                        SizedBox(height: 4),
                      ],
                    )
                  : Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
