import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/navigation/pages/page_lima_navigation.dart';
import 'package:get/get.dart';

class PageEmpatNavigation extends StatelessWidget {
  const PageEmpatNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page navigation 4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Get.back(),
                // navigator!.pop(),
                child: const Text("<< Back Page")),
            ElevatedButton(
                onPressed: () => Get.to(const PageLimaNavigation()),
                child: const Text("Next Page >>"))
          ],
        ),
      ),
    );
  }
}
