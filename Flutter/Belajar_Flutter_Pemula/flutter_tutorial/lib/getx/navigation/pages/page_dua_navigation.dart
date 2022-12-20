import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/navigation/pages/page_tiga_navigation.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';

class PageDuaNavigation extends StatelessWidget {
  const PageDuaNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page navigation 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text("<< Back Page")),
            ElevatedButton(
                onPressed: () => Get.toNamed(RouteName.page_3),
                    // navigator!.push(MaterialPageRoute(
                    // builder: (_) => const PageTigaNavigation())),
                child: const Text("Next Page >>")),
            Text(Get.arguments.toString())
          ],
        ),
      ),
    );
  }
}
