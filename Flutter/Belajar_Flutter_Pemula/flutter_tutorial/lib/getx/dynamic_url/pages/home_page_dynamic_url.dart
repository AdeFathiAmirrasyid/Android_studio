import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageDynamicUrl extends StatelessWidget {
  const HomePageDynamicUrl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page Dynamic URL"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/product'),
          child: Text("All Products >>"),
        ),
      ),
    );
  }
}
