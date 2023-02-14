import 'dart:math';

import 'package:flutter/material.dart';

class SoalTujuhSebelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 15,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return Container(
              width: 100,
              height: 100,
              color: Colors.amber,
              child: const Center(
                child: Text(
                  "Hello World",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }

          return Container(
            width: 100,
            height: 100,
            color: Colors.indigo,
            child: const Center(
              child: Text(
                "Hello World",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
        });
  }
}
