import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ButtonSheetApp());
}

class ButtonSheetApp extends StatelessWidget {
  const ButtonSheetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: PageButtonSheets());
  }
}

class PageButtonSheets extends StatelessWidget {
  const PageButtonSheets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Sheets"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("You have pushed the button this many times"),
            Text("0")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              color: Colors.amber,
              child: Center(
                child: ListView(
                  children:  [
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: () {}, child: Text("SAVE"))
                  ],
                ),
              ),
            ),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
