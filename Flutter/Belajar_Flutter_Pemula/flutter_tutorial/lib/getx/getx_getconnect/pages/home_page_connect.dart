import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/getx_getconnect/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../routes/route_name_connect.dart';

class HomePageConnect extends StatelessWidget {
  final userController = Get.find<UserController>();
  HomePageConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALL USERS"),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(RouteNameConnect.add),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Obx(() => Padding(
              padding: const EdgeInsets.all(20),
              child: userController.users.isEmpty
                  ? const Center(
                      child: Text("Belum Ada Data"),
                    )
                  : ListView.builder(
                      itemCount: userController.users.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: const CircleAvatar(),
                        title: Text("${userController.users[index].name}"),
                        subtitle: Text("${userController.users[index].email}"),
                        trailing: IconButton(
                          onPressed: () => userController
                              .delete(userController.users[index].id),
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red[900],
                          ),
                        ),
                        onTap: () => Get.toNamed(RouteNameConnect.profile,
                            arguments: userController.users[index].id),
                      ),
                    ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.get_app_rounded),
      ),
    );
  }
}
