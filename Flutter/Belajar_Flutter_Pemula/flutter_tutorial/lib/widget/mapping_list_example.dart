import 'package:flutter/material.dart';

void main() {
  runApp(MappingListExample());
}

class MappingListExample extends StatelessWidget {
  final List<Map<String, dynamic>> myList = [
    {
      "name": "Ade Fathi Amirrasyid",
      "age": 24,
      "hobby": [
        'happy coding',
        'fotografer',
        'Design',
        'happy coding',
        'fotografer',
        'Design',
        'happy coding',
        'fotografer',
        'Design'
      ]
    },
    {
      "name": "Diah Insani",
      "age": 25,
      "hobby": ['Masak', 'Traveling', 'Shoping']
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mapping List"),
        ),
        body: ListView(
          children: myList.map((data) {
            List myHobby = data['hobby'];
            return Card(
              margin: EdgeInsets.all(10),
              color: Colors.grey[500],
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        CircleAvatar(),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name ${data['name']}"),
                            Text("Age ${data['age']}")
                          ],
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: myHobby.map((hobby) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            color: Colors.amber,
                            padding: EdgeInsets.all(10),
                            child: Text(hobby),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
