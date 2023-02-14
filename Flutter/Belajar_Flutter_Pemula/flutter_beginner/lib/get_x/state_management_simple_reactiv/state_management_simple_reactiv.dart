import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final myC = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management Simple dan Reactive Get X"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Contoh Reactive", style: TextStyle(fontSize: 20)),
            Obx(() => Text("${myC.reactiveCounter}",
                style: const TextStyle(fontSize: 50))),
            ElevatedButton(
              onPressed: () {
                myC.increment();
              },
              child: const Text("Tambah data Reactive"),
            ),
            const SizedBox(height: 30),
            const Text("Contoh Simple", style: TextStyle(fontSize: 20)),
            GetBuilder<MyController>(
                builder: (controller) => Text("${controller.simpleCounter}",
                    style: const TextStyle(fontSize: 50))),
            ElevatedButton(
                onPressed: () {
                  myC.simpleIncrement();
                },
                child: const Text("Bottom Simple")),
            ElevatedButton(
                onPressed: () {
                  myC.refreshTampilan();
                },
                child: const Text("Bottom Refresh")),
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var reactiveCounter = 0.obs;
  int simpleCounter = 0;
  increment() => reactiveCounter++;

  void simpleIncrement() {
    simpleCounter++;
    if (simpleCounter % 5 == 0) {
      update();
    }
  }

  void refreshTampilan() {
    update();
  }
}
