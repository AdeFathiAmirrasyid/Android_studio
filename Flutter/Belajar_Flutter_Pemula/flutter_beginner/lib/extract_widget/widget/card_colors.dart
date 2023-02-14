import 'package:flutter/material.dart';

class CardColors extends StatelessWidget {
  String textColors;
  Color colorRec;
  CardColors({required this.textColors, required this.colorRec, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: colorRec,
      child: Center(
        child: Text(
          textColors,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
