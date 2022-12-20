import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/http_request_firebase/providers/provider_players.dart';
import 'package:provider/provider.dart';

class DetailPlayerPage extends StatelessWidget {
  static const routeName = "/detail-player";

  const DetailPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<ProviderPlayers>(context, listen: false);
    final playerId = ModalRoute.of(context)?.settings.arguments as String;
    final selectPlayer = players.selectById(playerId);

    final TextEditingController nameController =
        TextEditingController(text: selectPlayer.name);
    final TextEditingController positionController =
        TextEditingController(text: selectPlayer.position);
    final TextEditingController imageController =
        TextEditingController(text: selectPlayer.imageUrl);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Player"),
        actions: [
          IconButton(
              onPressed: () {
                players
                    .editPlayer(playerId, nameController.text,
                        positionController.text, imageController.text)
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Berhasil diubah"),
                    duration: Duration(seconds: 2),
                  ));
                  Navigator.pop(context);
                });
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageController.text,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Image.network("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"),
                  ),
                ),
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Posisi"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  players
                      .editPlayer(playerId, nameController.text,
                          positionController.text, imageController.text)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Berhasil diubah"),
                      duration: Duration(seconds: 2),
                    ));
                    Navigator.pop(context);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
