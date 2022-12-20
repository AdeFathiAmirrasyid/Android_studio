import 'package:flutter/material.dart';
import 'package:flutter_tutorial/http_request_firebase/providers/provider_players.dart';
import 'package:provider/provider.dart';

class AddPlayer extends StatelessWidget {
  static const routeName = "/add-player";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  AddPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<ProviderPlayers>(context, listen: false);
    addPlayer() {
      player
          .addPlayer(nameController.text, positionController.text,
              imageController.text)
          .then((response) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Berhasil ditambahkan"),
          duration: Duration(seconds: 2),
        ));
        Navigator.pop(context);
      }).catchError((err) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("ERROR $err"),
          content: const Text("Tidak dapat menambahkan player"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okey"))
          ],
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Player"),
        actions: [
          IconButton(onPressed: addPlayer, icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Posisi"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Image URL"),
                  textInputAction: TextInputAction.done,
                  controller: imageController,
                  onEditingComplete: addPlayer),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.bottomRight,
                child: OutlinedButton(
                    onPressed: addPlayer, child: const Text("Submit")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
