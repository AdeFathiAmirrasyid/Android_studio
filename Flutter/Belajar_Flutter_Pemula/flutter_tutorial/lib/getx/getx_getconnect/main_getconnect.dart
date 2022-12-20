import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/getx_getconnect/controllers/user_controller.dart';
import 'package:flutter_tutorial/getx/getx_getconnect/pages/home_page_connect.dart';
import 'package:flutter_tutorial/getx/getx_getconnect/routes/app_page_connects.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePageConnect(),
      getPages: AppPageConnects.pages,
    );
  }
}
