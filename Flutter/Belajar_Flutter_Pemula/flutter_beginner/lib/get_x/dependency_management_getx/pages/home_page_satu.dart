import 'package:flutter/material.dart';
import 'home_page_dua.dart';

class HomePageSatu extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Page 1"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "${myC.data['name']} - ${myC.data['age']}",
              //   style: const TextStyle(fontSize: 35),
              // ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePageDua(),
                  ));
                },
                child: const Text("next pages"),
              ),
            ],
          ),
        ));
  }
}
