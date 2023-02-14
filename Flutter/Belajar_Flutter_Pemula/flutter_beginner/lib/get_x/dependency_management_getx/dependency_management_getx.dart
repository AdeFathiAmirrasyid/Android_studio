import 'package:app/get_x/dependency_management_getx/pages/home_page_satu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/controller_depedency.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final myC = Get.lazyPut(() => ControllerDepedency(),);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageSatu(),
    );
  }
}
