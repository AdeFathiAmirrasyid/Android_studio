import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/main_bindings/pages/home_count.dart';
import 'package:flutter_tutorial/getx/main_bindings/routes/app_page.dart';
import 'package:get/get.dart';


void main() {
  runApp(const BindingApp());
}

class BindingApp extends StatelessWidget {
  const BindingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BindingsPageHome(),
      getPages: AppPages.pages,
    );
  }
}
