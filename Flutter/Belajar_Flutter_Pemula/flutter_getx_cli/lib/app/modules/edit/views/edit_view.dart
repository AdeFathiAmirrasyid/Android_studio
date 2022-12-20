import 'package:flutter/material.dart';
import '../../home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final data = homeController.findById(Get.arguments);
    controller.name.text = data.name!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              autocorrect: false,
              controller: controller.name,
              decoration: const InputDecoration(
                labelText: "Product Name",
                hintText: "Input product name here...",
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () =>
                  homeController.edit(Get.arguments, controller.name.text),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () =>
                    homeController.edit(Get.arguments, controller.name.text),
                child: const Text("Edit Product"))
          ],
        ),
      ),
    );
  }
}
