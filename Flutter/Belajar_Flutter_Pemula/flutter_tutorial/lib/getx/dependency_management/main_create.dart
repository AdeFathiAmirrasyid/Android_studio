import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tutorial/getx/dependency_management/pages_create/home_page_create.dart';

void main(){
  runApp(MainCreateApp());
}

class MainCreateApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomePageCreate()
    );
  }
}
