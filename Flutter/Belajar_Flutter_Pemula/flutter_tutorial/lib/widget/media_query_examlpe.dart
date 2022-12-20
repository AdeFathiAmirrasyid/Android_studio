import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp
  // ]);
  runApp(const MediaQueryExample());
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQueqyPage(),
    );
  }
}

class MediaQueqyPage extends StatelessWidget {
  const MediaQueqyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidht = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: const Text("Media Query"),
    );

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
        appBar: myAppBar,
        body: Center(
          child: Column(
            children: [
              Container(
                height: bodyHeight * 0.3,
                width: mediaQueryWidht,
                color: Colors.amber,
              ),
              Container(
                height: bodyHeight * 0.7,
                color: Colors.red,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return const ListTile(
                          leading: CircleAvatar(), title: Text("Hallo Semua"));
                    },
                    itemCount: 100),
              )
            ],
          ),
        ));
  }
}
