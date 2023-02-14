import 'package:flutter/material.dart';

class NavigationProductDetailPage extends StatelessWidget {
  const NavigationProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Product"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("back to product"),
        ),
      ),
    );
  }
}
