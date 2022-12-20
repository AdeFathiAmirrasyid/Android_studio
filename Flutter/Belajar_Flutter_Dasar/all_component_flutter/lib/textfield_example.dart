import 'package:flutter/material.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({Key? key}) : super(key: key);

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Text Field"),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                  // obscureText:  true, only Password
                  decoration: InputDecoration(
                    fillColor: Colors.lightBlue[50],
                      filled: true,
                      icon: Icon(Icons.adb),
                      suffix: Container(width: 5, height: 5, color: Colors.red,),
                      prefixIcon: Icon(Icons.person),
                      prefixText: "Name : ",
                      prefixStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      labelText: "Nama Lengkap",
                      hintText: "Nama Lengkap Hello..",
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: controller),
              Text(controller.text)
            ],
          ),
        ),
      ),
    );
  }
}
