import 'package:flutter/material.dart';

class SoalDuaSebelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Soal - 12",
          style: TextStyle(fontSize: 20),
        ),
            const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.indigo,
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

            const SizedBox(width: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.indigo[400],
              child: const Center(
                child: Text(
                  "Hello World",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.indigo,
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

            const SizedBox(width: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.indigo[400],
              child: const Center(
                child: Text(
                  "Hello World",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
