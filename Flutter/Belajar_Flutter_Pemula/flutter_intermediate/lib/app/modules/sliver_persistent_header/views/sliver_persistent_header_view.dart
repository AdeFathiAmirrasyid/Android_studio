import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sliver_persistent_header_controller.dart';

class SliverPersistentHeaderView
    extends GetView<SliverPersistentHeaderController> {
  const SliverPersistentHeaderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text("Sliver Persistent Header View"),
            flexibleSpace: FlutterLogo(size: 200),
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: MyDelegateClass(
                  maxExtent: 200,
                  minExtent: 100,
                title: "Menu Makanana",
                id: "501"
              )),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Center(
              child: Text(
                "Hello ${index + 1}",
                style: const TextStyle(fontSize: 24),
              ),
            );
          }, childCount: 30)),
          SliverPersistentHeader(
              pinned: true,
              delegate: MyDelegateClass(
                  maxExtent: 200, minExtent: 100,
                  title: "Menu Minuman",
                  id: "521"
              )),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Center(
                  child: Text(
                    "Hello ${index + 1}",
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              }, childCount: 30)),
          SliverGrid.count(crossAxisCount: 3,
          children: List.generate(15, (index) => Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          )),
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 150,
            children: List.generate(15, (index) => Container(
              color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
            )),
          ),
        ],
      ),
    );
  }
}

class MyDelegateClass extends SliverPersistentHeaderDelegate {
  double maxExtent;
  double minExtent;
  String id;
  String title;

  MyDelegateClass({required this.maxExtent, required this.minExtent,
  required this.id, required this.title
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          child: Image.network(
            "https://picsum.photos/id/$id/200/300",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Text(title,
              style: const TextStyle(fontSize: 24, color: Colors.white)),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
