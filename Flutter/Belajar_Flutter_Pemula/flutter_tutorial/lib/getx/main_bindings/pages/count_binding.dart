import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/binding_countroller.dart';

class PageCountBindings extends StatelessWidget {
  final bindingController = Get.find<BindingController>();
  PageCountBindings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                "${bindingController.count}",
                style: TextStyle(fontSize: 55),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bindingController.add(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
