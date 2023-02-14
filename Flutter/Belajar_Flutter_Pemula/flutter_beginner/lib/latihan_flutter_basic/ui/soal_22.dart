import 'dart:math';

import 'package:flutter/material.dart';

class SoalDuaPuluhDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.greenAccent),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image:
                NetworkImage("https://picsum.photos/id/879/200/300")),
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(150)),
        width: 280,
        height: 280,
      ),
    );
  }
}
