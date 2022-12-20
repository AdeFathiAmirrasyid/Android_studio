import 'package:flutter/material.dart';

class NewFiturFlutter extends StatefulWidget {
  const NewFiturFlutter({Key? key}) : super(key: key);

  @override
  State<NewFiturFlutter> createState() => _NewFiturFlutterState();
}

class _NewFiturFlutterState extends State<NewFiturFlutter> {
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFilter = ColorFilter.mode(Colors.blue, BlendMode.screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ColorFiltered(
      colorFilter: colorFilter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Widget Demo GDG 2019 china"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SelectableText(
                "Ini adalah selectable text. silahkan pilihsaya",
                style: TextStyle(fontSize: 20),
                showCursor: true,
                cursorColor: Colors.red,
                cursorWidth: 3,
              ),
              const SizedBox(
                height: 10,
              ),
              ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    if (index == 0) {
                      colorFilter =
                          const ColorFilter.mode(Colors.blue, BlendMode.screen);
                    } else if (index == 1) {
                      colorFilter = const ColorFilter.mode(
                          Colors.green, BlendMode.softLight);
                    } else {
                      colorFilter = const ColorFilter.mode(
                          Colors.purple, BlendMode.multiply);
                    }

                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = (i == index) ? true : false;
                    }
                  });
                },
                fillColor: Colors.red[50],
                selectedColor: Colors.red,
                selectedBorderColor: Colors.red,
                splashColor: Colors.lightBlue,
                highlightColor: Colors.amber,
                borderRadius: BorderRadius.circular(15),
                children: const [
                  Icon(Icons.access_alarm),
                  Icon(Icons.adb),
                  Icon(Icons.add_comment),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
