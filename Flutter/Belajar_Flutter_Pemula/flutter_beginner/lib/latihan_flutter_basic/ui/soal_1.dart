import 'package:flutter/material.dart';

class SoalSatu extends StatelessWidget {
  const SoalSatu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Soal - 1",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            "HELLO WORLD",
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
