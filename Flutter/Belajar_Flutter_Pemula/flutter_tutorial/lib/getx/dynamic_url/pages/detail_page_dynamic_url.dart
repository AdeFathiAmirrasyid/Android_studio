import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageDynamicUrl extends StatelessWidget {
  const DetailPageDynamicUrl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product ID ${Get.parameters['id']}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Product id ${Get.parameters['name']}"),
            Text("Product Ukuran ${Get.parameters['ukuran']}"),
          ],
        ),
      ),
    );
  }
}
