import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(ChangeThemeApp());
}

class ChangeThemeApp extends StatelessWidget {
  const ChangeThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },
        ),
      ),
    );
  }
}
