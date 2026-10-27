import 'package:ecommeceappcourse/controller/notificatons_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    NotificatonsController controller = Get.put(NotificatonsController());
    return Scaffold(
      body: GetBuilder<NotificatonsController>(
        builder: (controller) => HandlindDataView(
          statusRequset: controller.statusRequset,
          widget: Container(
            padding: EdgeInsets.all(8),
            child: ListView(
              children: [
                SizedBox(height: 8),
                ...List.generate(
                  controller.data.length,
                  (index) => Stack(
                    children: [
                      ListTile(
                        title: Container(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            controller.data[index]['notifications_title'],
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        subtitle: Container(
                          padding: EdgeInsets.all(6),

                          child: Text(
                            controller.data[index]['notifications_body'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 6,
                        top: 18,
                        child: Text(
                          " ${Jiffy.parse(controller.data[index]['notifications_datetime']).fromNow()}",
                          style: TextStyle(color: ColorConstant.puplerDistinct),
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
