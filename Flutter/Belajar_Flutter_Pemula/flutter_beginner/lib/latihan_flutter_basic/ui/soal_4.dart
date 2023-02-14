import 'dart:math';

import 'package:flutter/material.dart';

class SoalEmpat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Soal - 4",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 40),
          Transform.rotate(angle: pi / 2, child: const FlutterLogo(size: 150)),
        ],
      ),
    );
  }
}
