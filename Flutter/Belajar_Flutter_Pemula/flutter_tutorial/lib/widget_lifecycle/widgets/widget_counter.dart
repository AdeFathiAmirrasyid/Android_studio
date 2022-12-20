import 'package:flutter/material.dart';

import '../pages/other_page.dart';
class WidgetCounter extends StatefulWidget {
  WidgetCounter({super.key, required this.counter,}){

    print("-----------------------");
    print("Constructor Widget");
  }

  final int counter;

  @override
  State<WidgetCounter> createState(){
    print("createState");
    return _WidgetCounterState();
  }
}

class _WidgetCounterState extends State<WidgetCounter> {


  @override
  void initState() {
    super.initState();
    print("initState()");
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant WidgetCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Old : ${oldWidget.counter}");
    print("didUpdateWidget()");
    print("New : ${widget.counter}");
  }

  @override
  void deactivate() {
    print("deactivate()");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose()");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("Build Widget");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.counter}",
            style: const TextStyle(fontSize: 35),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, OtherPage.routeName, arguments: widget.counter);
            },
            child: const Text("Go to Other Page"),
          )
        ],
      ),
    );
  }
}
