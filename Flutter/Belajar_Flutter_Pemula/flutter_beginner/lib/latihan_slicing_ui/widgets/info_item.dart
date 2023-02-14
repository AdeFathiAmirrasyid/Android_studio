import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  String postsValue;
  String postsString;
  InfoItem({required this.postsValue, required this.postsString, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(postsValue,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text(
          postsString,
        ),
      ],
    );
  }
}
