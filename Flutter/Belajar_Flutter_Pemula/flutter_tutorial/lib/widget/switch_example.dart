import 'package:flutter/material.dart';

void main() {
  runApp(SwitchExample());
}

class SwitchExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySwitchPage(),
    );
  }
}

class MySwitchPage extends StatefulWidget {
  @override
  State<MySwitchPage> createState() => _MySwitchPageState();
}

class _MySwitchPageState extends State<MySwitchPage> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = !isSwitch;
                  });
                }),
            Text((isSwitch == true) ? "Switch On" : "Switch Off")
          ],
        ),
      ),
    );
  }
}
