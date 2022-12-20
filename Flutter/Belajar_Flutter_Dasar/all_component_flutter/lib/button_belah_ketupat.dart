
import 'package:all_component_flutter/colorfull_button/colorfull_buttons.dart';
import 'package:flutter/material.dart';

class ButtonBelahKetupat extends StatelessWidget {
  const ButtonBelahKetupat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ColorFull Buttons"),),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorFullButtons(Colors.pink,Colors.blue,Icons.adb),
              ColorFullButtons(Colors.amber,Colors.red,Icons.comment),
              ColorFullButtons(Colors.green,Colors.purple,Icons.computer),
              ColorFullButtons(Colors.blue,Colors.yellow,Icons.contact_phone),
            ],
          ),
        )
      ),
    );
  }
}
