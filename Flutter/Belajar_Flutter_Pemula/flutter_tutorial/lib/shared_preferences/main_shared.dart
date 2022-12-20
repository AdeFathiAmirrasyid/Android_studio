import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const SharedApp());
}

class SharedApp extends StatefulWidget {
  const SharedApp({Key? key}) : super(key: key);

  @override
  State<SharedApp> createState() => _SharedAppState();
}

class _SharedAppState extends State<SharedApp> {
  int counter = 0;
  bool isDark = false;

  Future<void> setPreference() async {
    final jembatan = await SharedPreferences.getInstance();

    if (jembatan.containsKey('myData')) {
      jembatan.clear();
    }
    final myData = json
        .encode({'counter': counter.toString(), 'isDark': isDark.toString()});
    jembatan.setString('myData', myData);
    setState(() {});
  }

  Future<void> getPreference() async {
    final jembatan = await SharedPreferences.getInstance();

    if (jembatan.containsKey('myData')) {
      final myData = json.decode(jembatan.getString('myData').toString() ) as Map<String, dynamic>;
      counter = int.parse(myData['counter']);
      isDark = myData['isDark'] == "true" ? true : false;
    }
  }

  minus() {
    counter -= 1;
    setPreference();
  }

  add() {
    setPreference();
    counter += 1;
  }

  changeTheme() {
    isDark = !isDark;
    setPreference();
  }

  void refresh() {
    counter = 0;
    isDark = false;
    setPreference();
  }

  ThemeData dark = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primaryColorDark: Colors.amber,
          primarySwatch: Colors.amber,
          accentColor: Colors.amber),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white, width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)))));

  ThemeData light = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primaryColorDark: Colors.amber,
          primarySwatch: Colors.amber,
          accentColor: Colors.amber),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black, width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)))));
  @override
  Widget build(BuildContext context) {
    print("build");
    return FutureBuilder(
        future: getPreference(),
        builder: (context, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: isDark ? dark : light,
              home: Scaffold(
                appBar: AppBar(
                  title: const Text("Counter Apps"),
                  actions: [
                    IconButton(
                        onPressed: refresh, icon: const Icon(Icons.refresh))
                  ],
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Angka saat ini adalah : $counter",
                        style: const TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                              onPressed: minus,
                              child: const Icon(Icons.remove)),
                          OutlinedButton(
                              onPressed: add, child: const Icon(Icons.add)),
                        ],
                      )
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: changeTheme,
                  child: const Icon(Icons.color_lens),
                ),
              ),
            ));
  }
}
