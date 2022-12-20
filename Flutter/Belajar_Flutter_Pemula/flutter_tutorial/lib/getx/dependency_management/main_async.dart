import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainAsyncApp());
}

class MainAsyncApp extends StatelessWidget {
  const MainAsyncApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePageAsync(),
    );
  }
}

class HomePageAsync extends StatelessWidget {
  const HomePageAsync({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            OutlinedButton(
                onPressed: () => Get.to(() => CounterPageAsync()),
                child: Text("Next >>"))
          ],
        ),
      ),
    );
  }
}

class CounterPageAsync extends StatelessWidget {
  // final count = 0.obs;
final c = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page Async"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("${c.count}", style: TextStyle(fontSize: 35),)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Get.putAsync<SharedPreferences>(() async {
        //   final prefs = await SharedPreferences.getInstance();
        //   await prefs.setInt('counter', 99);
        //   count.value = prefs.getInt('counter')!.toInt();
        //   return prefs;
        // }),
        onPressed: () => c.setData(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyController extends GetxController{
  final count = 0.obs;
  Future<void> setData() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 99);
    count.value = prefs.getInt('counter')!.toInt();

  }
}
