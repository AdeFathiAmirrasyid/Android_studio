import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/router/router_photo.dart';

class RouterGaleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Router Galeri"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Router Galeri",
              style: TextStyle(fontSize: 50, fontFamily: 'Viga'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "<< back",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/routerphoto');
                    },
                    child: const Text(
                      "next >>",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
