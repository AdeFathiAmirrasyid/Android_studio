import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: "tag1",
          child: ClipOval(
              child: Image.network(
            "https://picsum.photos/id/756/300/300",
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
