import 'dart:math';

import 'package:flutter/material.dart';

class SoalEnamSebelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(bottom: 20),
        color: Color.fromARGB(255, Random().nextInt(150), Random().nextInt(200),
            Random().nextInt(256)),
        child: const Center(
          child: Text(
            "Hello World",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
