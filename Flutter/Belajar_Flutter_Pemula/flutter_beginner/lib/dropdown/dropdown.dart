import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [
    {"judul": "Pilihan - 1", "data": 1},
    {"judul": "Pilihan - 2", "data": 2},
    {"judul": "Pilihan - 3", "data": 3}
  ];

  late int dataAwal;


  @override
  void initState() {
    dataAwal = data[0]['data'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: DropdownButton(
            value: dataAwal,
            items: data
                .map((e) => DropdownMenuItem<int>(
                      value: e['data'],
                      child: Text("${e['judul']}"),
                    ))
                .toList(),
            onChanged: (value) {
              print(value);
              setState(() {
                dataAwal = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
