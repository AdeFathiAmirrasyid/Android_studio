import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppLifeCycle());
}

class MyAppLifeCycle extends StatelessWidget {
  const MyAppLifeCycle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAppLifeCyclePage(),
    );
  }
}

class MyAppLifeCyclePage extends StatefulWidget {
  const MyAppLifeCyclePage({Key? key}) : super(key: key);

  @override
  State<MyAppLifeCyclePage> createState() => _MyAppLifeCyclePageState();
}

class _MyAppLifeCyclePageState extends State<MyAppLifeCyclePage>
    with WidgetsBindingObserver {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    switch (state) {
      case AppLifecycleState.inactive:
        setState(() {
          counter = 99;
        });
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        setState(() {
          counter = -20;
        });
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    print(counter);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COUNTER"),
      ),
      body: Center(
        child: Text(
          "$counter",
          style: TextStyle(fontSize: 35),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}
