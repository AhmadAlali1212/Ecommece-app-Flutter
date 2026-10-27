import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/get_decode_poly_line.dart';
import 'package:ecommeceappcourse/core/services/service.dart';
import 'package:ecommeceappcourse/data/model/orders_model.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  MyService myService = Get.find();

  StatusRequset statusRequset = StatusRequset.loading;
  late OrdersModel ordersModel;
  Set<Polyline> polyLineSet = {};
  GoogleMapController? gms;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? destlat;
  double? destlong;
  double? currentLat;
  double? currentLong;
  StreamSubscription<Position>? positionSubscription;
  Timer? timer;

  initialData() async {
    markers.add(
      Marker(
        markerId: MarkerId("current"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      ),
    );

    kGooglePlex = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 16,
    );
    update();

    // markers.removeWhere((m) => m.markerId.value == "Curr");
    // markers.add(
    //   Marker(
    //     markerId: MarkerId("Curr"),
    //     position: LatLng(currentLat!, currentLong!),
    //   ),
    // );
  }

  getdelvieryLocation() async {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId.toString())
        .snapshots()
        .listen((event) {
          if (event.exists) {
            destlat = event.get("lat");
            destlong = event.get("long");
            updateMarkerDelviery(destlat!, destlong!);
            getDecodePolyLine(currentLat!, currentLong!, destlat!, destlong!);
          }
        });
    update();
  }

  updateMarkerDelviery(double newLat, double newLong) {
    markers.removeWhere((m) => m.markerId.value == "dest");
    markers.add(
      Marker(markerId: MarkerId("dest"), position: LatLng(newLat, newLong)),
    );
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["orderModeslList"];
    initialData();
    super.onInit();
  }

  @override
  void onClose() {
    gms?.dispose();
    super.onClose();
  }
}
