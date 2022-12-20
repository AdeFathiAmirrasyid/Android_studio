import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/http_request_firebase/pages/add_player.dart';
import 'package:flutter_tutorial/http_request_firebase/pages/detail_player_page.dart';
import 'package:flutter_tutorial/http_request_firebase/providers/provider_players.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePageFirebase extends StatefulWidget {
  const HomePageFirebase({super.key});

  @override
  State<HomePageFirebase> createState() => _HomePageFirebaseState();
}

class _HomePageFirebaseState extends State<HomePageFirebase> {
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<ProviderPlayers>(context).initialData();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final allPlayerProvider = Provider.of<ProviderPlayers>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Players"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddPlayer.routeName);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: (allPlayerProvider.sumPlayer == 0)
            ? SizedBox(
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "No Data",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AddPlayer.routeName);
                          },
                          child: const Text("Add Player",
                              style: TextStyle(
                                fontSize: 18,
                              )))
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: allPlayerProvider.sumPlayer,
                itemBuilder: (context, index) {
                  var id = allPlayerProvider.allPlayer[index].id;
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, DetailPlayerPage.routeName,
                          arguments: id);
                    },
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(
                    //     allPlayerProvider.allPlayer[index].imageUrl,
                    //   ),
                    // ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CachedNetworkImage(
                          imageUrl: allPlayerProvider.allPlayer[index].imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.network("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"),
                        ),
                      ),
                    ),
                    title: Text(
                      allPlayerProvider.allPlayer[index].name,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd()
                          .format(allPlayerProvider.allPlayer[index].createdAt),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        allPlayerProvider.deletePlayer(id).then((_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Berhasil dihapus"),
                            duration: Duration(milliseconds: 500),
                          ));
                        });
                      },
                    ),
                  );
                }));
  }
}
