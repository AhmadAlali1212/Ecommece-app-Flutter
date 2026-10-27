import 'package:ecommeceappcourse/controller/cart_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/functions/translate_data_base.dart';
import 'package:ecommeceappcourse/view/widget/cart/custom_bottom_button_for_price.dart';
import 'package:ecommeceappcourse/view/widget/cart/custom_card_items_cart.dart';
import 'package:ecommeceappcourse/view/widget/cart/custom_items_count_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(title: Text("my_cart".tr)),
      backgroundColor: ColorConstant.whitePrimary,
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => CustomBottomButtonForPrice(
          controllerCouponText: controller.controllerCouponText!,
          onApplayCoupon: () {
            cartController.checkCuopon();
          },
          price: "${cartController.priceOrders}\$",
          discount: "1000\$",
          shipping: "${cartController.couponDiscount}%",
          totalPrice: "${cartController.getTotalPrice()}\$",
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlindDataView(
          statusRequset: cartController.statusRequset,
          widget: Container(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: ListView(
              children: [
                SizedBox(height: 3),
                CustomItemsCountInCart(
                  title: "items_in_list".trArgs([
                    cartController.totalCountItem.toString(),
                  ]),
                ),
                SizedBox(height: 5),
                Container(
                  child: Column(
                    children: [
                      ...List.generate(
                        cartController.data.length,
                        (index) => GetBuilder<CartController>(
                          builder: (controller) => CustomCardItemsCart(
                            name: TranslateDataBase(
                              " ${cartController.data[index].itemsNameAr}",
                              " ${cartController.data[index].itemsName}",
                            ),
                            price: TranslateDataBase(
                              " ${cartController.data[index].priceItems}\$",
                              " ${cartController.data[index].priceItems}\$",
                            ),
                            count: TranslateDataBase(
                              " ${cartController.data[index].countItems}",
                              " ${cartController.data[index].countItems}",
                            ),
                            onAdd: () async {
                              await cartController.cartAdd(
                                cartController.data[index].itemsId.toString(),
                              );

                              await cartController.refreshCountAndPrice();
                            },
                            onRemove: () async {
                              await cartController.cartRemove(
                                cartController.data[index].itemsId.toString(),
                              );
                              await cartController.refreshCountAndPrice();
                            },
                            image:
                                "${AppLink.itemsImage}/${cartController.data[index].itemsImage}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
