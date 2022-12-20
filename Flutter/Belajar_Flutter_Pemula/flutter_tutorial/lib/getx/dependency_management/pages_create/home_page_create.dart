import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/dependency_management/pages_create/shop_page/shop.dart';
import 'package:get/get.dart';

class HomePageCreate extends StatelessWidget {
  const HomePageCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page Create"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Page Create"),
            OutlinedButton(onPressed:() => Get.to(() =>  ShopPage()), child: const Text("SHOP >>"))
          ],
        ),
      ),
    );
  }
}
