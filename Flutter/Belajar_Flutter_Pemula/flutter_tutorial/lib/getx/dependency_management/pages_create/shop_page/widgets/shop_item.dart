import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/shop_controller.dart';

class ShopItem extends StatelessWidget {
  final shopController = Get.find<ShopController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
            onPressed: () {
              shopController.quantity.value--;
              Get.find<ShopController>(tag: 'total').total.value--;
            },
            icon: const Icon(Icons.remove)),
        Obx(
              () => Text(
            "${shopController.quantity}",
            style: const TextStyle(fontSize: 25),
          ),
        ),
        IconButton(
            onPressed: () {
              shopController.quantity.value++;
              Get.find<ShopController>(tag: 'total').total.value++;
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}
