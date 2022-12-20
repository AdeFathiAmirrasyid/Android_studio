import 'package:flutter/material.dart';
import 'package:flutter_tutorial/checkbox/pages/add_color_page_checkbox.dart';
import 'package:flutter_tutorial/checkbox/pages/home_page_check_box.dart';
import 'package:flutter_tutorial/checkbox/providers/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CheckBoxApp());
}

class CheckBoxApp extends StatelessWidget {
  const CheckBoxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MultiColor(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePageCheckBox(),
        routes: {
          HomePageCheckBox.routeName: (context) => const HomePageCheckBox(),
          AddColorPageCheckBox.routeName: (context) => AddColorPageCheckBox(),
        },
      ),
    );
  }
}
