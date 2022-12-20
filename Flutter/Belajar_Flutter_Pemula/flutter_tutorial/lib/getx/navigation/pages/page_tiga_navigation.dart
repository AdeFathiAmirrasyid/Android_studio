import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/navigation/pages/page_empat_navigation.dart';
import 'package:get/get.dart';


class PageTigaNavigation extends StatelessWidget {
  const PageTigaNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page navigation 3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Get.back(), child: const Text("<< Back Page")),
            ElevatedButton(onPressed: () => Get.to(const PageEmpatNavigation()), child: Text("Next Page >>"))
          ],
        ),
      ),
    );
  }
}
