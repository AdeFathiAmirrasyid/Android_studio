import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/dependency_management/pages_create/shop_page/widgets/shop_item.dart';
import 'package:get/get.dart';

import '../../controllers/shop_controller.dart';

class ShopPage extends StatelessWidget {
  final shopController = Get.put(ShopController(), tag: 'total');
  final quantityController = Get.create(() => ShopController());

  ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SHOP Page Create"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder:(context, index) =>  ShopItem(),
      ),
      floatingActionButton:
          CircleAvatar(child: Obx(() => Text("${shopController.total.value}"))),
    );
  }
}
