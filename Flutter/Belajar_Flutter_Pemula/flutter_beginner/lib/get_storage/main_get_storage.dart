import 'package:app/get_storage/pages/home_page_get_storage.dart';
import 'package:app/get_storage/pages/login_get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/login_bindings.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginGetStorage(),
      getPages: [
        GetPage(
            name: '/home',
            page: () => const HomePageGetStorage()),

        GetPage(
            name: '/login',
            page: () => LoginGetStorage(),
            binding: LoginBindings()),
      ],
    );
  }
}
