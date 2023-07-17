import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shared_preferences_controller.dart';

class SharedPreferencesView extends GetView<SharedPreferencesController> {
  const SharedPreferencesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferencesView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => controller.removeData(), icon: const Icon(Icons.restore))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(
              () => Text(
                "${controller.textData}",
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => controller.decrement(),
                  child: const Text("-", style: TextStyle(fontSize: 20))),
              ElevatedButton(
                  onPressed: () => controller.increment(),
                  child: const Text("+", style: TextStyle(fontSize: 20))),
            ],
          ),
        ],
      ),
    );
  }
}
