import 'package:all_component_flutter/demo_project/main_demo.dart';
import 'package:flutter/material.dart';

class DemoProject extends StatelessWidget {
  const DemoProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainDemo(),
    );
  }
}
