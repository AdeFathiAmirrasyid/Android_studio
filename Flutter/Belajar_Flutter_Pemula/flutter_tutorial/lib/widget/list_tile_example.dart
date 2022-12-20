import 'package:flutter/material.dart';

void main() {
  runApp(const ListTileExample());
}

class ListTileExample extends StatelessWidget {
  const ListTileExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListTile"),
        ),
        body: ListView(
          children: const [
            ListTile(
              title: Text("Fathie Insanie"),
              subtitle: Text("everyone is busy"),
              trailing: Text("10:00 PM"),
              leading: CircleAvatar(),
            ),
            Divider(
              color: Colors.black,
            ),ListTile(
              title: Text("Fathie Insanie"),
              subtitle: Text("everyone is busy"),
              trailing: Text("10:00 PM"),
              leading: CircleAvatar(),
            ),
            Divider(
              color: Colors.black,
            ),ListTile(
              title: Text("Fathie Insanie"),
              subtitle: Text("everyone is busy"),
              trailing: Text("10:00 PM"),
              leading: CircleAvatar(),
            ),
            Divider(
              color: Colors.black,
            ),ListTile(
              title: Text("Fathie Insanie"),
              subtitle: Text("everyone is busy"),
              trailing: Text("10:00 PM"),
              leading: CircleAvatar(),
            ),
            Divider(
              color: Colors.black,
            ),ListTile(
              title: Text("Fathie Insanie"),
              subtitle: Text("everyone is busy"),
              trailing: Text("10:00 PM"),
              leading: CircleAvatar(),
            ),
            Divider(
              color: Colors.black,
            ),ListTile(
              title: Text("Fathie Insanie"),
              subtitle: Text("everyone is busy"),
              trailing: Text("10:00 PM"),
              leading: CircleAvatar(),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
