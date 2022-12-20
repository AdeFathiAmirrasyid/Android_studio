import 'dart:ui';
import 'package:flutter/material.dart';

class FontFeaturesExample extends StatelessWidget {
  const FontFeaturesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Typography"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              const Text(
                "Contoh 01 (Tanpa apapun)",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Contoh 02 (Small Caps)",
                style: TextStyle(
                    fontSize: 20, fontFeatures: [FontFeature.enable('smcp')]),
              ),
              const Text(
                "Contoh 1/2 (Small Caps and Frac)",
                style: TextStyle(fontSize: 20, fontFeatures: [
                  FontFeature.enable('smcp'),
                  FontFeature.enable('frac')
                ]),
              ),
              const Text("Contoh Cardo 19 (nothing)",
                  style: TextStyle(fontSize: 30, fontFamily: "Cardo_regular")),
              const Text(
                "Contoh Cardo 19 (old style)",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Cardo_regular",
                    fontFeatures: [
                      FontFeature.oldstyleFigures(),
                    ]),
              ),
              const Text(
                "Gabriola (Default)",
                style: TextStyle(
                  fontSize: 0,
                  fontFamily: "Gabriola_regular",
                ),
              ),
              Text(
                "Gabriola (Style Set no 5)",
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: "Gabriola_regular",
                    fontFeatures: [
                      FontFeature.stylisticSet(5),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
