import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Get X"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Judul"),
                        content: Text("Ini Pesannya"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {}, child: Text("Cancel")),
                          ElevatedButton(onPressed: () {}, child: Text("Ya")),
                        ],
                      );
                    });
              },
              child: const Text("Dialog"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Judul",
                    content: Text("pesannya"),
                    actions: [
                      ElevatedButton(onPressed: () {}, child: Text("Cancel")),
                      ElevatedButton(onPressed: () {}, child: Text("Ya")),
                    ],
                  );
                },
                child: const Text("Dialog Get X"))
          ],
        ),
      ),
    );
  }
}
