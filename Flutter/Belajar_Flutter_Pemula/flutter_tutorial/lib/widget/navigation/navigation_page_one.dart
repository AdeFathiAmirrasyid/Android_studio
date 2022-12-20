import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/navigation/navigation_page_two.dart';

class NavigationPageOne extends StatelessWidget {
  const NavigationPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
      ),
      body: const Center(
        child: Text(
          "Page One",
          style: TextStyle(fontSize: 30, fontFamily: 'Viga'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return NavigationPagetwo();
            })
          );
        },
        child: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
