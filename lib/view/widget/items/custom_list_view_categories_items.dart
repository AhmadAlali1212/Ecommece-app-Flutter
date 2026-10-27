import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/controller/items_comtroller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/functions/translate_data_base.dart';
import 'package:ecommeceappcourse/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListViewCategoriesItems extends GetView<HomeController> {
  const CustomListViewCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CategoriesHome(
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
      ),
    );
  }
}

class CategoriesHome extends GetView<ItemsComtroller> {
  final CategoriesModel categoriesModel;

  const CategoriesHome({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.changeCat(
              categoriesModel.categoriesId!,
              categoriesModel.categoriesId.toString(),
            );
          },

          child: Column(
            children: [
              GetBuilder<ItemsComtroller>(
                builder: (controller) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  height: 35,
                  decoration:
                      controller.selectedItem == categoriesModel.categoriesId!
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 4,

                              color: ColorConstant.ThirdPuplerDistinct,
                            ),
                          ),
                        )
                      : null,
                  child: Text(
                    TranslateDataBase(
                      "${categoriesModel.categoriesNameAr}",
                      "${categoriesModel.categoriesName}",
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),

        // controller.selectedItem == categoriesModel.categoriesId!
        //     ? Container(
        //         padding: EdgeInsets.symmetric(horizontal: 10),
        //         height: 10,
        //         width: 65,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: ColorConstant.ThirdPuplerDistinct,
        //         ),
        //       )
        //     : Container(
        //         padding: EdgeInsets.symmetric(horizontal: 10),
        //         height: 10,
        //         width: 65,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           //     color: ColorConstant.ThirdPuplerDistinct,
        //         ),
        //       ),
      ],
    );
  }
}
