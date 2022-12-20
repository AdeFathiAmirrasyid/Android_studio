import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainReviewStateManagement());
}

class MainReviewStateManagement extends StatelessWidget {
  const MainReviewStateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MaterialApp(
        home: PageReviewStateManagement(),
      ),
    );
  }
}

class PageReviewStateManagement extends StatelessWidget {
  const PageReviewStateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    final counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review State Management"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Counter>(
              builder: (context, value, child) =>
                  Text(value.counter.toString(), style: const TextStyle(fontSize: 50),)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    counter.remove();
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {
                    counter.add();
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 35,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _counter = 0;

  get counter => _counter;

  void add() {
    _counter += 1;
    notifyListeners();
  }

  remove() {
    _counter -= 1;
    notifyListeners();
  }
}
