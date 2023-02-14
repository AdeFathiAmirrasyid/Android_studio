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
  final myC = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reactive Variables"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //RxInt
            const Text(
              "RxInt",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text("${myC.dataInt}")),
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        myC.decrementInt();
                      },
                      child: const Text("-"),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: () {
                          myC.incrementInt();
                        },
                        child: const Text("+"))
                  ],
                ),
              ],
            ),
            //RxString
            const Text(
              "RxString",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text("${myC.dataString}")),
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        myC.updateData();
                      },
                      child: const Text("update"),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: () {
                          myC.resetData();
                        },
                        child: const Text("reset"))
                  ],
                ),
              ],
            ),

            //RxDouble
            const Text(
              "RxDouble",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text("${myC.dataDouble}")),
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        myC.decData();
                      },
                      child: const Text("-"),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: () {
                          myC.incData();
                        },
                        child: const Text("+"))
                  ],
                ),
              ],
            ),

            //RxBoolean
            const Text(
              "RxBoolean",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text("${myC.dataBool}")),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: () {
                          myC.gantiData();
                        },
                        child: const Text("Ganti Boolean"))
                  ],
                ),
              ],
            ),

            //RxList
            const Text(
              "RxList",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text("${myC.dataList}")),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: () {
                          myC.tambahList();
                        },
                        child: const Text("Tambah"))
                  ],
                ),
              ],
            ),

            const Divider(thickness: 3),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const CircleAvatar(),
                    title: Obx(() => Text("${myC.dataMap['name']}")),
                    subtitle: Text("${myC.dataMap['age']} Tahun"),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      myC.gantiName();
                    },
                    child: const Text("Ganti"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  // Rx Integer
  RxInt dataInt = 0.obs;
  incrementInt() => dataInt++;
  decrementInt() => dataInt--;

  // Rx String
  RxString dataString = "data".obs;
  updateData() => dataString.value = "data (update)";
  resetData() => dataString.value = "data";

  // Rx Double
  RxDouble dataDouble = 0.0.obs;
  incData() => dataDouble.value++;
  decData() => dataDouble.value--;

  // RX Boolean
  RxBool dataBool = false.obs;
  void gantiData() => dataBool.toggle();

  // RX List
  RxList<int> dataList = [1, 2, 3, 4].obs;
  int angkaSelanjutnya = 5;
  void tambahList() {
    dataList.add(angkaSelanjutnya);
    angkaSelanjutnya++;
  }

  // RX Mapping
  RxMap<String, dynamic> dataMap =
      {"id": 1, "name": "Fathi_Insa", "age": 90}.obs;

  void gantiName() {
    dataMap['name'] = "Fathie_insanie";
  }
}
