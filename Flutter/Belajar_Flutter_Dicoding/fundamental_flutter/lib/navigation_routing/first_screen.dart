import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/secondScreen',
                    );
                  },
                  child: const Text("Go to Second Screen"))),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/secondScreenWithData',
                        arguments: "Hello from First Screen!");
                  },
                  child: const Text("Navigation With Data"))),
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    final result =
                        await Navigator.pushNamed(context, '/returnDataScreen');
                    SnackBar snackBar = SnackBar(content: Text("$result"));
                    scaffoldMessenger.showSnackBar(snackBar);
                  },
                  child: const Text("Return Data Form Another Screen"))),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/replacementScreen');
                  },
                  child: const Text("Replace Screen"))),
        ],
      ),
    );
  }
}
