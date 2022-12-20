import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(DepedencyManagementApp());
}

class DepedencyManagementApp extends StatelessWidget {
  final c = Get.lazyPut(() => MyControllerDepedencyManagement(), tag: 'tag-text', fenix: true);
  DepedencyManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageDepedencyManagement(),
    );
  }
}

class PageDepedencyManagement extends StatelessWidget {
  const PageDepedencyManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Depedency Management"),
          actions: [
            IconButton(
                onPressed: () => Get.to(() => CountPageDepedencyManagement()),
                icon: Icon(Icons.keyboard_arrow_right))
          ],
        ),
        body: const Center(
            child: Text(
          "Home Page",
          style: TextStyle(fontSize: 55),
        )));
  }
}

class CountPageDepedencyManagement extends StatelessWidget {
  final c = Get.put(MyControllerDepedencyManagement(),
      tag: 'tag-count', permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Depedency Management"),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => PageTextDepedencyManagement()),
              icon: const Icon(Icons.keyboard_arrow_right))
        ],
      ),
      body: Center(
        child: Obx(() => Text(
              "${c.count}",
              style: const TextStyle(fontSize: 55),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.add(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PageTextDepedencyManagement extends StatelessWidget {
  // final c = Get.put(MyControllerDepedencyManagement(),
  //   tag: 'tag-text',
  // );

  final c = Get.find<MyControllerDepedencyManagement>(tag: 'tag-text');

  PageTextDepedencyManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: TextField(
            controller: c.textC,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}

class MyControllerDepedencyManagement extends GetxController {
  var count = 0.obs;
  var textC = TextEditingController();
  void add() => count++;
}
