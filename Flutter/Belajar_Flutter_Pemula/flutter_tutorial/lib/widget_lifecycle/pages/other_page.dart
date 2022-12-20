import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget_lifecycle/pages/counter_page.dart';

class OtherPage extends StatelessWidget {
  static const routeName = "/other-page";
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Page"),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, CounterPage.routeName,
                arguments: ModalRoute.of(context)?.settings.arguments as int?);
          },
          child: const Text("Go to Counter Page"),
        ),
      ),
    );
  }
}
