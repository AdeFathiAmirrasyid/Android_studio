import 'package:app/bindings_builder_getx/pages_bindings/page_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/counter_binding.dart';


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
      getPages: [
        GetPage(
            name: '/counter',
            page: () => PageBindings(),
            binding: CounterBindings())
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bindings Builder GetX"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed("/counter");
          },
          child: const Text("Counter Page"),
        ),
      ),
    );
  }
}
