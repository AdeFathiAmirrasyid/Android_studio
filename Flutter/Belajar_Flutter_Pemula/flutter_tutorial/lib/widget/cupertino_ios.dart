import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(const CupertinoIos());
}

class CupertinoIos extends StatelessWidget {
  const CupertinoIos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageCupertinoIos(),
    );
  }
}

class PageCupertinoIos extends StatelessWidget {
  const PageCupertinoIos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cupertino"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Platform.isIOS
                      ? CupertinoAlertDialog(
                          title: const Text("Delete Item"),
                          content:
                              const Text("Are you sure to delete this item ?"),
                          actions: [
                            TextButton(
                                onPressed: () {}, child: const Text("No")),
                            TextButton(
                                onPressed: () {}, child: const Text("Yes")),
                          ],
                        )
                      : AlertDialog(
                          title: const Text("Delete Item"),
                          content:
                              const Text("Are you sure to delete this item ?"),
                          actions: [
                            TextButton(
                                onPressed: () {}, child: const Text("No")),
                            TextButton(
                                onPressed: () {}, child: const Text("Yes")),
                          ],
                        );
                });
          },
          child: const Text(
            "Alert",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
