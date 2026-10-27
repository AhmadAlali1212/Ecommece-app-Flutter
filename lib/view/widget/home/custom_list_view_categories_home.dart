import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/functions/translate_data_base.dart';
import 'package:ecommeceappcourse/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomListViewCategoriesHome extends GetView<HomeController> {
  const CustomListViewCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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

class CategoriesHome extends GetView<HomeController> {
  final CategoriesModel categoriesModel;

  const CategoriesHome({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.goToItems(
              controller.categories,
              categoriesModel.categoriesId!,
              categoriesModel.categoriesId.toString(),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstant.ThirdPuplerDistinct,
            ),
            child: SvgPicture.network(
              "${AppLink.categoriesImage}/${categoriesModel.categoriesImage}",
              height: 70,
              width: 70,
            ),
          ),
        ),
        Text(
         TranslateDataBase("${categoriesModel.categoriesNameAr}", "${categoriesModel.categoriesName}"),
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ],
    );
  }
}
