import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/dynamic_url/routes/dynamic_route.dart';
import 'package:get/get.dart';
import 'package:flutter_tutorial/getx/dynamic_url/pages/home_page_dynamic_url.dart';

void main(){
  runApp(const MainDynamicApp());
}

class MainDynamicApp extends StatelessWidget {
  const MainDynamicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomePageDynamicUrl(),
      getPages: DynamicRoute.pages,
    );
  }
}
