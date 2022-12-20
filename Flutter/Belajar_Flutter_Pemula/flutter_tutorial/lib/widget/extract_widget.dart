import 'package:flutter/material.dart';

void main() {
  runApp(const ExtractWidget());
}

class ExtractWidget extends StatelessWidget {
  const ExtractWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListTile"),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return const ChatItem(
              imageURL:
                  "https://images.unsplash.com/photo-1664575196412-ed801e8333a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
              name: "Diah Insani",
              subtitle: "Nothing Imposible",
            );
          },
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imageURL;
  final String name;
  final String subtitle;

  const ChatItem(
      {super.key,
      required this.imageURL,
      required this.name,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
      ),
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: Text("10:00 PM"),
    );
  }
}
