import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authController = Get.find<AuthController>();

  final ThemeData light = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.light,
          primary: Colors.white,
          secondary: Colors.black));

  final ThemeData dark = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.dark,
          primary: const Color(0xFF686D76),
          secondary: Colors.white));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? const Color(0xFF373A40) : Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Get.theme.colorScheme.secondary,
            )),
        actions: [
          IconButton(
              onPressed: () => authController.logout(),
              icon: Icon(
                Icons.logout,
                color: Get.theme.colorScheme.secondary,
              ))
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              AvatarGlow(
                    endRadius: 110,
                    glowColor: Colors.black,
                    duration: const Duration(seconds: 2),
                    child: Container(
                        margin: const EdgeInsets.all(15),
                        width: 175,
                        height: 175,
                        child: Obx(
                          () => ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: authController.userModel.value.photoUrl ==
                                    'noimage'
                                ? Image.asset("assets/logo/noimage.png",
                                    fit: BoxFit.cover)
                                : Image.network(
                                    authController.userModel.value.photoUrl!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        )),
                  ),
              Obx(
                () => Text(
                  "${authController.userModel.value.name}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "${authController.userModel.value.email}",
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  onTap: () => Get.toNamed(Routes.UPDATE_STATUS),
                  leading: const Icon(Icons.note_add_outlined),
                  title: const Text(
                    "Update Status",
                    style: TextStyle(fontSize: 22),
                  ),
                  trailing: const Icon(Icons.arrow_right),
                ),
                ListTile(
                  onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                  leading: const Icon(Icons.person),
                  title: const Text(
                    "Change Profile",
                    style: TextStyle(fontSize: 22),
                  ),
                  trailing: const Icon(Icons.arrow_right),
                ),
                ListTile(
                  onTap: () => Get.changeTheme(Get.isDarkMode ? light : dark),
                  leading: const Icon(Icons.color_lens),
                  title: const Text(
                    "Change Theme",
                    style: TextStyle(fontSize: 22),
                  ),
                  trailing: Text(Get.isDarkMode ? "Dark" : "Light"),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(bottom: context.mediaQueryPadding.bottom + 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chat App",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
                Text(
                  "v.1.0",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
