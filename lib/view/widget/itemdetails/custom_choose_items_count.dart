import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomChooseItemsCount extends StatelessWidget {
  const CustomChooseItemsCount({
    super.key,
    required this.price,
    required this.count,
    required this.onPressedAdd,
    required this.onPressedRemove,
  });

  final String price;
  final String count;

  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onPressedAdd, icon: Icon(Icons.add, size: 32)),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 8),
          width: 70,
          height: 43,
          decoration: BoxDecoration(
            border: BoxBorder.all(
              color: ColorConstant.colorSecondMain,
              width: 2,
            ),
          ),
          child: Text(
            count,

            style: TextStyle(
              color: ColorConstant.colorSecondMain,
              fontSize: 32,
              height: 0.9,
            ),
          ),
        ),
        IconButton(
          onPressed: onPressedRemove,
          icon: Icon(Icons.remove, size: 32),
        ),
        SizedBox(width: 120),
        Text(
          price,
          style: TextStyle(
            color: ColorConstant.secondPuplerDistinct,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
