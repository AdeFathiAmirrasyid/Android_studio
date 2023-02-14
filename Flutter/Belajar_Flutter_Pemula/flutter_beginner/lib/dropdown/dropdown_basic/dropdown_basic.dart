import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List<Map<String, dynamic>> dataList = [
    {"country": "Brazil", "id": 1},
    {"country": "Indonesia", "id": 2},
    {"country": "Argentina", "id": 3},
    {"country": "Portugal", "id": 4},
    {"country": "Francis", "id": 5},
    {"country": "India", "id": 6},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Search Basic"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownSearch<Map<String, dynamic>>(
          items: dataList,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                labelText: "Menu mode",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          dropdownBuilder: (context, selectedItem) =>
              Text(selectedItem?['country'] ?? "Belum ada negara"),
          popupProps: PopupProps.menu(
            showSearchBox: true,
            itemBuilder: (context, item, isSelected) =>
                ListTile(title: Text(item['country'].toString())),
          ),
          onChanged: (value) {
            print(value?['country']);
          },

          selectedItem: const {"country": "Indonesia", "id": 2},
        ),
      ),
    );
  }
}
