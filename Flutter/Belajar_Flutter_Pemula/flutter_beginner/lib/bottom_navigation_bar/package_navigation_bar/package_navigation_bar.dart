import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage:
                NetworkImage("https://picsum.photos/id/${870 + index}/200/300"),
          ),
          title: Text(faker.person.name()),
          subtitle: Text(DateFormat.yMMMEd().add_jms().format(DateTime.now())),
        ),
      ),
      Center(child: Text("Pages 2")),
      Center(child: Text("Pages 3")),
      Center(child: Text("Pages 4")),
      Center(child: Text("Pages 5")),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faker"),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: currentIndex,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
      ),
    );
  }
}
