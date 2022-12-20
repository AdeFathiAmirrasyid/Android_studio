import 'package:flutter/material.dart';
import 'package:flutter_getx_cli/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
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
                  Get.find<HomeController>().add(controller.name.text),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () =>
                    Get.find<HomeController>().add(controller.name.text),
                child: const Text("Add Product"))
          ],
        ),
      ),
    );
  }
}
