import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/constant/image_assest.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlindDataView extends StatelessWidget {
  final StatusRequset statusRequset;
  final Widget widget;

  const HandlindDataView({
    super.key,
    required this.statusRequset,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    switch (statusRequset) {
      case StatusRequset.loading:
        return _buildLottieView(
          asset: ImageAssest.loadinglottie,
          color: ColorConstant.puplerDistinct,
        );
      case StatusRequset.OfflineFailure:
        return _buildLottieView(
          asset: ImageAssest.errorlottie,
          color: ColorConstant.secondPuplerDistinct,
        );
      case StatusRequset.serviceFailure:
        return _buildLottieView(
          asset: ImageAssest.noDataFoundlottie,
          color: ColorConstant.ThirdPuplerDistinct,
          topMargin: 170,
        );
      case StatusRequset.failure:
        return _buildLottieView(
          asset: ImageAssest.errorlottie,
          color: ColorConstant.puplerLight,
          topMargin: 170,
        );
      default:
        return widget;
    }
  }

  Widget _buildLottieView({
    required String asset,
    required Color color,
    double topMargin = 0,
  }) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Center(
        child: Lottie.asset(
          asset,
          width: 220,
          height: 220,
          delegates: LottieDelegates(
            values: [
              ValueDelegate.color(['**'], value: color),
            ],
          ),
        ),
      ),
    );
  }
}
