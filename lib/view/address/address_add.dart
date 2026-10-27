import 'package:ecommeceappcourse/controller/address/add_address_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerAddress = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(title: Text("address_add".tr)),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (controllerAddress) => HandlindDataView(
            statusRequset: controllerAddress.statusRequset,
            widget: Stack(
              children: [
                if (controllerAddress.kGooglePlex != null)
                  GoogleMap(
                    mapType: MapType.hybrid,
                    markers: controllerAddress.markers.toSet(),
                    onTap: (latLong) {
                      controllerAddress.AddNewLocation(latLong);
                    },
                    initialCameraPosition: controllerAddress.kGooglePlex!,
                    onMapCreated: (GoogleMapController controllerMap) {
                      controllerAddress.completerController!.complete(
                        controllerMap,
                      );
                    },
                  ),
                Positioned(
                  bottom: 20,
                  left: 100,
                  child: Container(
                    child: MaterialButton(
                      color: ColorConstant.puplerDistinct,
                      onPressed: () {
                        controllerAddress.goToAddrssDetails();
                      },
                      minWidth: 200,
                      child: Text(
                        "complete".tr,
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
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
