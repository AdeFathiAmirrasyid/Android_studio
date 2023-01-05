import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text('Search'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onChanged: (value) => controller.searchFriend(
                    value, authController.userModel.value.email!),
                controller: controller.searchController,
                cursorColor: Colors.red[900],
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1)),
                    hintText: "Search new friend..",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    suffixIcon: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Icon(
                          Icons.search,
                          color: Colors.red[900],
                        ))),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.tempSearch.isEmpty
            ? Center(
                child: SizedBox(
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: Lottie.asset("assets/lottie/empty.json"),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.tempSearch.length,
                itemBuilder: (context, index) => ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black38,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: controller.tempSearch[index]["photoUrl"] ==
                                    'noimage'
                                ? Image.asset(
                                    "assets/logo/noimage.png",
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    controller.tempSearch[index]["photoUrl"],
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      title: Text(
                        "${controller.tempSearch[index]["name"]}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "${controller.tempSearch[index]["email"]}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      trailing: GestureDetector(
                        onTap: () => authController.addNewConnection(
                            controller.tempSearch[index]["email"]),
                        child: const Chip(
                          label: Text("Message"),
                        ),
                      ),
                    )),
      ),
    );
  }
}
