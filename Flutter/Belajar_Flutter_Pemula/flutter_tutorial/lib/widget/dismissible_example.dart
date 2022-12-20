import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainDismissibleExample());
}

class MainDismissibleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DismissibleExample(),
    );
  }
}

class DismissibleExample extends StatelessWidget {
  var faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissible"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete,
                size: 25,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                print("END TO START");
              }
            },
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Confirm'),
                    content: Text('Are you sure to delete this item?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(false); // Dismiss alert dialog
                        },
                      ),TextButton(
                        child: Text('Ya'),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(true); // Dismiss alert dialog
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Center(
                  child: Text("${index + 1}"),
                ),
              ),
              title: Text(faker.person.name()),
              subtitle: Text(faker.lorem.sentence()),
            ),
          );
        },
      ),
    );
  }
}
