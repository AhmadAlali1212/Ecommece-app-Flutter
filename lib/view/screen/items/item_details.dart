import 'package:ecommeceappcourse/controller/item_details_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/functions/translate_data_base.dart';
import 'package:ecommeceappcourse/view/widget/itemdetails/custom_bottom_bar_item_details.dart';
import 'package:ecommeceappcourse/view/widget/itemdetails/custom_choose_items_count.dart';
import 'package:ecommeceappcourse/view/widget/itemdetails/custom_item_colors.dart';
import 'package:ecommeceappcourse/view/widget/itemdetails/custom_stack_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ecommeceappcourse/view/widget/itemdetails/show_rating_for_item.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBarItemDetails(),
      backgroundColor: ColorConstant.whitePrimary,
      body: GetBuilder<ItemDetailsController>(
        builder: (controller) => HandlindDataView(
          statusRequset: controller.statusRequset,
          widget: ListView(
            children: [
              CustomStackImage(
                imageId: controller.itemsModel!.itemsId!,
                imageUrl:
                    "${AppLink.itemsImage}/${controller.itemsModel?.itemsImage}",
              ),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  TranslateDataBase(
                    " ${controller.itemsModel?.itemsNameAr}",
                    " ${controller.itemsModel?.itemsName}",
                  ),
                  style: TextStyle(
                    color: ColorConstant.colorSecondMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              SizedBox(height: 15),
              CustomChooseItemsCount(
                onPressedAdd: () {
                  controller.add();
                },
                count: "${controller.itemcount}",
                onPressedRemove: () {
                  controller.remove();
                },
                price: TranslateDataBase(
                  " ${controller.itemsModel?.itemspricediscount}\$",
                  " ${controller.itemsModel?.itemspricediscount}\$",
                ),
              ),

              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  TranslateDataBase(
                    " ${controller.itemsModel?.itemsDesc}",
                    " ${controller.itemsModel?.itemsDesc}",
                  ),
                  style: TextStyle(
                    color: ColorConstant.puplerLight,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Rating summary and action
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GetBuilder<ItemDetailsController>(
                  builder: (controller) {
                    final total = controller.itemsModel?.totalRating ?? 0;
                    final count = controller.itemsModel?.ratingCount ?? 0;
                    final double avg = (count > 0) ? (total / count) : 0.0;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${avg.toStringAsFixed(1)}',
                              style: TextStyle(
                                color: ColorConstant.colorSecondMain,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6),
                            ...List.generate(5, (i) {
                              return Icon(
                                i < avg.round()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: ColorConstant.puplerDistinct,
                                size: 20,
                              );
                            }),
                            SizedBox(width: 6),
                            Text('($count)'),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showRatingForItem(context);
                          },
                          child: Text('rate'.tr),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              CustomItemColors(),
            ],
          ),
        ),
      ),
    );
  }
}
