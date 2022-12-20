import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            // collapsedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text("Sliver Presistent Header"),
            ),
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: MyClass(
                  minExtent: 100, maxExtent: 150, title: "Menu Makanan")),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, i) => Card(
                        child: Center(
                            child: Text(
                          "Item ke -> ${i + 1}",
                          style: const TextStyle(fontSize: 22),
                        )),
                      ),
                  childCount: 10)),
          SliverPersistentHeader(
              pinned: true,
              delegate: MyClass(
                  minExtent: 100, maxExtent: 150, title: "Menu Minuman")),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, i) => Card(
                    child: Center(
                        child: Text(
                          "Item ke -> ${i + 1}",
                          style: const TextStyle(fontSize: 22),
                        )),
                  ),
                  childCount: 30))
        ],
      ),
    );
  }
}

class MyClass extends SliverPersistentHeaderDelegate {
  MyClass(
      {required this.maxExtent, required this.minExtent, required this.title});

  @override
  final double minExtent;
  @override
  final double maxExtent;
  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // ini adalah widget yang akan di build pada persisten header
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          "https://picsum.photos/id/100/1000",
          fit: BoxFit.cover,
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "$title",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
