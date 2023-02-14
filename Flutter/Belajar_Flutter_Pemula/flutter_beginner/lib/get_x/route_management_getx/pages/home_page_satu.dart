import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePageSatuRoute extends StatelessWidget {
  const HomePageSatuRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route Management GetX"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ElevatedButton(onPressed: () {
              Get.toNamed('/page_satu');
            }, child: const Text("Page 1")),
            ElevatedButton(onPressed: () {
              Get.toNamed('/page_dua');
            }, child: const Text("Page 2")),
          ],
        ),
      ),
    );
  }
}
