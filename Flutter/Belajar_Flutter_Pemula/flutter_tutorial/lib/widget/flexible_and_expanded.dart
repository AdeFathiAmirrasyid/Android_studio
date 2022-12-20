import 'package:flutter/material.dart';

void main() {
  runApp(FlexibleAndExpanded());
}

class FlexibleAndExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageFlexibleAndExpanded(),
    );
  }
}

class PageFlexibleAndExpanded extends StatelessWidget {
  const PageFlexibleAndExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible And Expanded"),
      ),
      body: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.red,
              height: 100,

            ),
          ),
            Flexible(
              flex: 4,
              child: Container(
              color: Colors.indigo,
              height: 100,

          ),
            ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.lightBlue,
              height: 100,

            ),
          ),
        ],
      ),
    );
  }
}
