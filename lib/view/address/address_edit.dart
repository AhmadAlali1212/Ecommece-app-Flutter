import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressEdit extends StatelessWidget {
  const AddressEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("address_edit".tr)),
      floatingActionButton: IconButton(onPressed: () {}, icon: Icon(Icons.add)),

      body: Container(),
    );
  }
}
