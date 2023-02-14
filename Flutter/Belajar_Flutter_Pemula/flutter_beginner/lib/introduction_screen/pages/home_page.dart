import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  static const routeName = '/home';

  HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? data = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Center(
          child: Text(data!),
        ));
  }
}
