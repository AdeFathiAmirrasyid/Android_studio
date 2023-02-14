import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pages_1 extends StatelessWidget {
  const Pages_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pages 1"),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.back();
          },
          child: const Text("Back"),
        ),
      ),
    );
  }
}
