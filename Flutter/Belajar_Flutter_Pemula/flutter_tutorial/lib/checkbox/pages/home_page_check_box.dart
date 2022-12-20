import 'package:flutter/material.dart';
import 'package:flutter_tutorial/checkbox/providers/colors.dart';
import 'package:provider/provider.dart';

import 'add_color_page_checkbox.dart';

class HomePageCheckBox extends StatefulWidget {
  static const routeName = "/home";
  const HomePageCheckBox({Key? key}) : super(key: key);

  @override
  State<HomePageCheckBox> createState() => _HomePageCheckBoxState();
}

class _HomePageCheckBoxState extends State<HomePageCheckBox> {
  bool allStatus = false;
  bool initStatus = true;

  @override
  void didChangeDependencies() {
    if (initStatus) {
      Provider.of<MultiColor>(context, listen: false).initialData();
      allStatus =  Provider.of<MultiColor>(context, listen: false).checkAllStatus();
      initStatus = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var colorsClass = Provider.of<MultiColor>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AddColorPageCheckBox.routeName),
              icon: const Icon(Icons.add))
        ],
      ),
      body: colorsClass.colors.isEmpty
          ? const Center(
              child: Text(
                "No Data",
                style: TextStyle(fontSize: 30),
              ),
            )
          : ListView(
              children: [
                CheckboxListTile(
                  value: allStatus,
                  onChanged: (value) {
                    setState(() {
                      allStatus = value!;
                      colorsClass.selectAll(allStatus);
                    });
                  },
                  title: const Text("Select all colors"),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                Divider(),
                ...colorsClass.colors
                    .map((e) => ChangeNotifierProvider.value(
                          value: e,
                          builder: (context, child) => CheckboxListTile(
                            value: e.status,
                            onChanged: (value) {
                              setState(() {
                                e.toogleStatus();
                                allStatus = colorsClass.checkAllStatus();
                                print(allStatus);
                              });
                            },
                            title: Text(e.title),
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 40),
                            secondary: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                colorsClass.deleteColor(e.id);
                              },
                            ),
                          ),
                        ))
                    .toList()
              ],
            ),
    );
  }
}
