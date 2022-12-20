import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_firebase/app/controllers/auth_controller.dart';
import 'package:project_firebase/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => authController.logout(),
              icon: const Icon(Icons.logout))
        ],
      ),
      // Realtime get data from Database
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.streamData(),
          builder: (context, snapshot) {
            var listAllDocs = snapshot.data?.docs;
            if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                  itemCount: listAllDocs?.length,
                  itemBuilder: (context, index) {
                    if ((listAllDocs?[index].data()
                            as Map<String, dynamic>)["price"] >=
                        10000) {
                      return ListTile(
                        onTap: () => Get.toNamed(Routes.EDIT_PRODUCT,
                            arguments: listAllDocs?[index].id),
                        title: Text(
                            "${(listAllDocs?[index].data() as Map<String, dynamic>)["name"]}"),
                        subtitle: Text(
                            "Rp ${(listAllDocs?[index].data() as Map<String, dynamic>)["price"]}"),
                        trailing: IconButton(
                          onPressed: () =>
                              controller.deleteProduct(listAllDocs?[index].id),
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    }
                    return SizedBox();
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      // One time get data from databse
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //     future: controller.getData(),
      //     builder: (context, snapshot) {
      //       var listAllDocs = snapshot.data!.docs;
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         return ListView.builder(
      //           itemCount: listAllDocs.length,
      //           itemBuilder: (context, index) => ListTile(
      //             title: Text(
      //                 "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
      //             subtitle: Text(
      //                 "Rp ${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
      //           ),
      //         );
      //       } else {
      //         return const Center(child: CircularProgressIndicator());
      //       }
      //     }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: const Icon(Icons.add),
      ),
    );
  }
}
