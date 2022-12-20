import 'dart:async';

import 'package:flutter/material.dart';

class TimerExample extends StatefulWidget {
  const TimerExample({Key? key}) : super(key: key);

  @override
  State<TimerExample> createState() => _TimerExampleState();
}

class _TimerExampleState extends State<TimerExample> {
  bool isStop = true;
  bool isBlack = true;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Timer Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                    color: (isBlack) ? Colors.black : Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Timer(
                      const Duration(seconds: 5),
                      () => setState(() {
                            isBlack = !isBlack;
                          }));
                },
                child: const Text("Ubah Warna 5 Detik kemudian"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Timer.run(() {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
                child: const Text("Ubah Warna secara langsung"),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  counter = 0;
                  isStop = false;
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if (isStop) {
                      timer.cancel();
                    }
                    setState(() {
                      counter++;
                    });
                  });
                },
                child: const Text("Start Timer"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  isStop = true;
                },
                child: const Text("Stop Timer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
