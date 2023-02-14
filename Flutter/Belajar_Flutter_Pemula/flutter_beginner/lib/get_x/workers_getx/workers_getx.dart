import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final myC = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workers GetX"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() =>
            Text("Terjadi Perubahan ${myC.input}x")),
            TextField(
              autocorrect: false,
              onChanged: (value) => myC.increment(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Inputan"),
            )
          ],
        )),
      ),
    );
  }
}

class MyController extends GetxController {
  var input = 0.obs;
  increment() => input++;

  @override
  void onInit() {
    // setiap perubahan
    // ever(input, (callback) => print("Perubahan"));

    // 1 kali perubahan
    // once(input, (callback) => print("1 kali pantauan"));

    // di eksekusi ketika sudah tidak menginputkan dan dijalankan ketika durasi waktu yang di tentukan
    // debounce(input, (callback) => print("di eksekusi bergantung pada waktu"),time: Duration(seconds: 2));

    // kebalikan dari debounce
    interval(input, (callback) => print("setiap 2 detik"), time: Duration(seconds: 2));
    super.onInit();
  }


}
