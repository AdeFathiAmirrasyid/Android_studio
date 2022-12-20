import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppLifecycle());
}

class MyAppLifecycle extends StatelessWidget {
  const MyAppLifecycle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget with WidgetsBindingObserver {
  HomePage() {
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
    );
  }
}
