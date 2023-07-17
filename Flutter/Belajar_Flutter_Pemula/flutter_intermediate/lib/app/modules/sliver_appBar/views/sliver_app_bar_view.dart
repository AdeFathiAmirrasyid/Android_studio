import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sliver_app_bar_controller.dart';

class SliverAppBarView extends GetView<SliverAppBarController> {
  const SliverAppBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: FlutterLogo(
      //     size: 200,
      //   ),
      //   centerTitle: true,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          SliverAppBar(
            pinned: true,
            // floating: true,
            // snap: true,
            expandedHeight: 200,
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text("Silver AppBar"),
            flexibleSpace: const Center(
              child: FlutterLogo(size: 200),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        height: 200,
                        color: Color.fromARGB(255, Random().nextInt(256),
                            Random().nextInt(256), Random().nextInt(256)),
                        child: Center(
                          child: Text(
                            "Hello $index",
                            style: const TextStyle(fontSize: 44),
                          ),
                        ),
                      ),
                  childCount: 10))
        ],
      ),
    );
  }
}
