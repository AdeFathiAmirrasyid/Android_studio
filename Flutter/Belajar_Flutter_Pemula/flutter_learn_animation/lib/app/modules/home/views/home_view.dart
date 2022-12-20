import 'package:flutter/material.dart';
import 'package:flutter_learn_animation/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.ANIMATED_WIDGET),
            child: const Text("Animated Widget"),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.BOX_TRANSITION),
            child: const Text("Decorated Box Transition"),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.FADE_TRANSITION),
            child: const Text("Fade Transition"),
          ),
        ]),
      ),
    );
  }
}
