import 'dart:math';

import 'package:flutter/material.dart';

class SoalSembilanSebelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        alignment: Alignment.bottomLeft,
        width: 250,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://picsum.photos/id/${index + 100}/200/300"))),
        margin: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Hello World ${index + 1}",
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}
