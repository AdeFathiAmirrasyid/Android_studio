import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const DateFormatExample());
}

class DateFormatExample extends StatelessWidget {
  const DateFormatExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date Time"),
        ),
        body: Center(
          child: Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
