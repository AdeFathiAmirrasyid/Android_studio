import 'dart:math';

import 'package:flutter/material.dart';

class SoalDuaPuluhSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.indigo,
          ),
          Container(
            width: 280,
            height: 280,
            color: Colors.blueAccent,
          ),
          Container(
            width: 260,
            height: 260,
            color: Colors.grey,
          ),
          Container(
            width: 240,
            height: 240,
            color: Colors.greenAccent,
          ),
          Container(
            width: 220,
            height: 220,
            color: Colors.orange,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
