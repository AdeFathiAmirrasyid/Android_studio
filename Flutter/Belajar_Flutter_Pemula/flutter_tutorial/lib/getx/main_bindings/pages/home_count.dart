import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';

class BindingsPageHome extends StatelessWidget {
  const BindingsPageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Get X Bindings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                // onPressed: () => Get.to(() => PageCountBindings(),
                // binding: BindingsBuilder(() {
                //   Get.put(BindingController());
                // })),
                onPressed: () => Get.toNamed(RouteName.count),
                child: const Text("Next >>"))
          ],
        ),
      ),
    );
  }
}
