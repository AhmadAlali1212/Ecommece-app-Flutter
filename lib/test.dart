import 'package:ecommeceappcourse/core/functions/check_internet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  initialdata() async {
    var res = await CheckInternet();
    print(res);
  }

  @override
  void initState() {
    initialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
