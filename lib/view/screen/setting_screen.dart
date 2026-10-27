import 'package:ecommeceappcourse/controller/setting_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/constant/image_assest.dart';
import 'package:ecommeceappcourse/core/localization/changed_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("app_settings".tr)),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(color: ColorConstant.puplerDistinct),
              ),
              Positioned(
                right: 165,
                top: Get.width / 3,
                child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: ColorConstant.whitePrimary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(ImageAssest.avatar),
                    radius: 40,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),

          GetBuilder<ChangedLocal>(
            builder: (localeController) => Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.brightness_6_outlined),
                      subtitle: Text(
                        localeController.isDarkMode
                            ? "dark_mode".tr
                            : "light_mode".tr,
                      ),
                      trailing: Switch(
                        onChanged: (val) {
                          localeController.changeThemeMode(val);
                        },
                        value: localeController.isDarkMode,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text("choose_language".tr),
                      subtitle: Text(
                        localeController.language?.languageCode == 'ar'
                            ? 'arabic'.tr
                            : 'english'.tr,
                      ),
                      trailing: DropdownButton<String>(
                        value: localeController.language?.languageCode ?? 'en',
                        items: [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text('english'.tr),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text('arabic'.tr),
                          ),
                        ],
                        onChanged: (val) {
                          if (val != null) localeController.changeLang(val);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          GetBuilder<SettingCnontroller>(
            builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      trailing: Switch(
                        onChanged: (val) {
                          controller.toggleNotificationsEnabled(val);
                        },
                        value: controller.isNotificationsEnabled,
                      ),
                      title: Text(
                        controller.isNotificationsEnabled
                            ? "disable_notifications".tr
                            : "enable_notifications".tr,
                      ),
                    ),
                    ...List.generate(controller.settingList.length, (index) {
                      return controller.settingList[index];
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
