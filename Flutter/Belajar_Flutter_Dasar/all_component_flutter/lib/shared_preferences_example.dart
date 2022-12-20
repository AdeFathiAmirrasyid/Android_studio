import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  const SharedPreferencesExample({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesExample> createState() =>
      _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  TextEditingController controller = TextEditingController(text: "No Name");
  bool isOn = false;
  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", controller.text);
    preferences.setBool("isOn", isOn);
  }

  Future<String> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("name") ?? "No Name";
  }

  Future<bool> getOn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("isOn") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shared Preference Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
              ),
              Switch(
                  value: isOn,
                  onChanged: (newValue) {
                    isOn = newValue;
                    setState(() {});
                  }),
              ElevatedButton(
                  onPressed: () {
                    saveData();
                  },
                  child: Text("Save")),
              ElevatedButton(
                  onPressed: () {
                    getName().then((value) {
                      controller.text = value;
                      setState(() {});
                      getOn().then((b) {
                        isOn = b;
                        setState(() {});
                      });
                    });
                  },
                  child: Text("Load"))
            ],
          ),
        ),
      ),
    );
  }
}
