import 'dart:math';

import 'package:flutter/material.dart';

class SoalDuaPuluhTiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(150)),
            width: 280,
            height: 280,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.white),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        NetworkImage("https://picsum.photos/id/879/200/300")),
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(150)),
            width: 255,
            height: 255,
          ),
        ],
      ),
    );
  }
}
