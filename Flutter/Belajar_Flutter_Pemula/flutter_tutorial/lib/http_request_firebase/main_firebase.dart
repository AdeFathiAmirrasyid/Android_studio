import 'package:flutter/material.dart';
import 'package:flutter_tutorial/http_request_firebase/pages/add_player.dart';
import 'package:flutter_tutorial/http_request_firebase/pages/detail_player_page.dart';
import 'package:flutter_tutorial/http_request_firebase/pages/home_page_firebase.dart';
import 'package:flutter_tutorial/http_request_firebase/providers/provider_players.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainFirebase());
}

class MainFirebase extends StatelessWidget {
  const MainFirebase({super.key});
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => ProviderPlayers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePageFirebase(),
        routes: {
          AddPlayer.routeName: (context) =>  AddPlayer(),
          DetailPlayerPage.routeName: (context) =>   DetailPlayerPage()
        },
      ),
    );
  }
}
