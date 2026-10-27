import 'dart:async';

import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressControllerAbstract extends GetxController {}

class AddAddressController extends AddAddressControllerAbstract {
  StatusRequset statusRequset = StatusRequset.loading;
  Position? position;
  Completer<GoogleMapController>? completerController;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;
  AddNewLocation(LatLng lating) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: lating));
    lat = lating.latitude;
    long = lating.longitude;
    update();
  }

  goToAddrssDetails() {
    Get.toNamed(
      AppRoutes.adressDetails,
      arguments: {"lat": lat.toString(), "long": long.toString()},
    );
  }
  // CameraPosition kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  // CameraPosition kLake = CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(37.43296265331129, -122.08832357078792),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414,
  // );

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    AddNewLocation(LatLng(position!.latitude, position!.longitude));

    statusRequset = StatusRequset.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completerController = Completer<GoogleMapController>();

    super.onInit();
  }
}
