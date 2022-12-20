import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes_name.dart';

class ProductPageDynamicUrl extends StatelessWidget {
  const ProductPageDynamicUrl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Product"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed('${RouteNameDynamic.product}/1?name=jaket&ukuran=XL'),
              child: const Text("Products 1"),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('${RouteNameDynamic.product}/2?name=Kaos Kaki baru&ukuran=jumbo'),
              child: const Text("Products 2"),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('${RouteNameDynamic.product}/3?name=Sendal Baru baru&ukuran=45'),
              child: const Text("Products 3"),
            ),
          ],
        ),
      ),
    );
  }
}
