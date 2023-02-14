import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSelected = true;
  double _sliderValue = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adaptive Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch.adaptive(
                value: _isSelected,
                onChanged: (value) {
                  setState(() {
                    _isSelected = value;
                  });
                }),
            Slider.adaptive(
                value: _sliderValue,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                }),
            defaultTargetPlatform == TargetPlatform.iOS
                ? Text("IOS")
                : Text("Android")
          ],
        ),
      ),
    );
  }
}
