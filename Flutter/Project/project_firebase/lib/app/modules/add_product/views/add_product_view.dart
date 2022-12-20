import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.priceController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Product Price',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () => controller.addProduct(
                    controller.nameController.text,
                    controller.priceController.text),
                child: const Text('Add Product')),
          ],
        ),
      ),
    );
  }
}
