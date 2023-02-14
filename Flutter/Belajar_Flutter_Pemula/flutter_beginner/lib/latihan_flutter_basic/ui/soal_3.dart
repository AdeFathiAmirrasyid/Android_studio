import 'package:flutter/material.dart';

class SoalTiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Soal - 3",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 40),
          FlutterLogo(size: 150),
        ],
      ),
    );
  }
}
