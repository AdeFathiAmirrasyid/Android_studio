import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/state_mixin/pages/home_page.dart';
import 'package:get/get.dart';

import 'bindings/state_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePageStateMixin(),
      initialBinding: StateBinding(),
    );
  }
}
