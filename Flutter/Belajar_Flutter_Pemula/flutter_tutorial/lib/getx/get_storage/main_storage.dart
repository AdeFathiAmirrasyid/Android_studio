import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/get_storage/pages/home_storage.dart';
import 'package:flutter_tutorial/getx/get_storage/pages/login_storage.dart';
import 'package:flutter_tutorial/getx/get_storage/routes/app_route_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/auth_controller.dart';
import 'controllers/login_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loginController = Get.put(LoginControllerStorage());
  final authController = Get.put(AuthControllerStorage());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authController.autoLogin(),
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return Obx(
          () => GetMaterialApp(
            home: authController.isAuth.isTrue ? HomeStorage() : LoginStorage(),
            getPages: AppRouteStorage.pages,
          ),
        );
      }
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    });
  }
}
