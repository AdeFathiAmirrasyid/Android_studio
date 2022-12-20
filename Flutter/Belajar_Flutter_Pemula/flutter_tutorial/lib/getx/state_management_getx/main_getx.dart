import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/state_management_getx/controllers/counter_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetXApp());
}

class GetXApp extends StatelessWidget {
  const GetXApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counterC = Get.put(CounterController());
    return Obx(() => MaterialApp(
          theme: counterC.isDark.value ? ThemeData.dark() : ThemeData.light(),
          home: HomePageGetx(),
        ));
  }
}

class HomePageGetx extends StatelessWidget {
  HomePageGetx({Key? key}) : super(key: key);
  var c = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(() => Text(
              "Angka ${c.counter}",
              style: const TextStyle(fontSize: 35),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.changeTheme(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
