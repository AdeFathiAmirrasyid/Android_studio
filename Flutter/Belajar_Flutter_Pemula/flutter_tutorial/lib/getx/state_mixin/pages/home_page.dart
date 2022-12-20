import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/mycontroller.dart';

class HomePageStateMixin extends GetView<MyControllerStsteMixin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
          child: controller.obx(
        (state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("id ${state!['id']}"),
            Text("Nama ${state['first_name'] + state['last_name']}"),
            Text("Email ${state['email']}"),
            Image.network("${state['avatar']}")
          ],
        ),
        onLoading: const Text("Loading..."),
        onEmpty: const Text("Belum ada data"),
        onError: (error) => Text(error.toString()),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getData(),
      ),
    );
  }
}
