import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/getbuilder_controller.dart';

void main() {
  runApp(SimpleGetBuilderApp());
}

class SimpleGetBuilderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple Get Builder"),
        ),
        body: Center(
          child: GetBuilder<GetBuilderController>(
              init: GetBuilderController(),
              builder: (controller) => Text(
                    "Angka ${controller.count}",
                    style: const TextStyle(fontSize: 35),
                  )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<GetBuilderController>().increment();
          },
        ),
      ),
    );
  }
}
