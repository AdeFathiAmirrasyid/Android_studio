import 'dart:async';

import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:intl/intl.dart';
import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  final authController = Get.find<AuthController>();
  final String chatId = (Get.arguments as Map<String, dynamic>)["chat_id"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Get.back(),
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 5),
              const Icon(Icons.arrow_back,color: Colors.white),
              const SizedBox(width: 5),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                child: StreamBuilder<DocumentSnapshot<Object?>>(
                    stream: controller.streamFriendData(
                        (Get.arguments as Map<String, dynamic>)["friendEmail"]),
                    builder: (context, snapFriendUser) {
                      if (snapFriendUser.connectionState ==
                          ConnectionState.active) {
                        var dataFriend =
                            snapFriendUser.data!.data() as Map<String, dynamic>;
                        if (dataFriend["photoUrl"] == "noimage") {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/logo/noimage.png",
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              dataFriend["photoUrl"],
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/logo/noimage.png",
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        title: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: controller.streamFriendData(
                (Get.arguments as Map<String, dynamic>)["friendEmail"]),
            builder: (context, snapFriendUser) {
              if (snapFriendUser.connectionState == ConnectionState.active) {
                var dataFriend =
                    snapFriendUser.data!.data() as Map<String, dynamic>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dataFriend["name"],
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white)),
                    Text(dataFriend["status"],
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white)),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Loading...", style: TextStyle(fontSize: 18)),
                  Text("Loading...", style: TextStyle(fontSize: 14)),
                ],
              );
            }),
        centerTitle: false,
      ),
      body: WillPopScope(
        onWillPop: () {
          if (controller.isShowEmoji.isTrue) {
            controller.isShowEmoji.value = false;
          } else {
            Navigator.pop(context);
          }
          return Future.value(false);
        },
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.streamChats(chatId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var allData = snapshot.data!.docs;
                    Timer(
                      Duration.zero,
                      () => controller.scrollController.jumpTo(
                          controller.scrollController.position.maxScrollExtent),
                    );
                    return ListView.builder(
                        controller: controller.scrollController,
                        itemCount: allData.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Column(
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  "${allData[index]["groupTime"]}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                ItemChat(
                                  msg: "${allData[index]["msg"]}",
                                  isSender: allData[index]["pengirim"] ==
                                          authController.userModel.value.email!
                                      ? true
                                      : false,
                                  time: "${allData[index]["time"]}",
                                )
                              ],
                            );
                          } else {
                            if (allData[index]["groupTime"] ==
                                allData[index - 1]["groupTime"]) {
                              return ItemChat(
                                msg: "${allData[index]["msg"]}",
                                isSender: allData[index]["pengirim"] ==
                                        authController.userModel.value.email!
                                    ? true
                                    : false,
                                time: "${allData[index]["time"]}",
                              );
                            } else {
                              return Column(
                                children: [
                                  Text(
                                    "${allData[index]["groupTime"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ItemChat(
                                    msg: "${allData[index]["msg"]}",
                                    isSender: allData[index]["pengirim"] ==
                                            authController
                                                .userModel.value.email!
                                        ? true
                                        : false,
                                    time: "${allData[index]["time"]}",
                                  )
                                ],
                              );
                            }
                          }
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: controller.isShowEmoji.isTrue
                      ? 2
                      : context.mediaQueryPadding.bottom),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      autocorrect: false,
                      autofocus: true,
                      onEditingComplete: () => controller.newChat(
                          authController.userModel.value.email!,
                          Get.arguments as Map<String, dynamic>,
                          controller.chatController.text),
                      controller: controller.chatController,
                      focusNode: controller.focusNode,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {
                            controller.focusNode.unfocus();
                            controller.isShowEmoji.toggle();
                          },
                          icon: const Icon(Icons.emoji_emotions_outlined),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Material(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red[900],
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () => controller.newChat(
                          authController.userModel.value.email!,
                          Get.arguments as Map<String, dynamic>,
                          controller.chatController.text),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(() => (controller.isShowEmoji.isTrue)
                ? SizedBox(
                    height: 325,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        controller.addEmojiToChat(emoji);
                      },
                      onBackspacePressed: () {
                        controller.deleteEmoji();
                      },
                      config: Config(
                        columns: 7,
                        emojiSizeMax: 32 *
                            (foundation.defaultTargetPlatform ==
                                    TargetPlatform.iOS
                                ? 1.30
                                : 1.0),
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        gridPadding: EdgeInsets.zero,
                        initCategory: Category.RECENT,
                        bgColor: const Color(0xFFF2F2F2),
                        indicatorColor: const Color(0xFFB71C1C),
                        iconColor: Colors.grey,
                        iconColorSelected: const Color(0xFFB71C1C),
                        backspaceColor: const Color(0xFFB71C1C),
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        noRecents: const Text(
                          'No Recents',
                          style: TextStyle(fontSize: 20, color: Colors.black26),
                          textAlign: TextAlign.center,
                        ), // Needs to be const Widget
                        loadingIndicator:
                            const SizedBox.shrink(), // Needs to be const Widget
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL,
                      ),
                    ),
                  )
                : const SizedBox()),
          ],
        ),
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
    required this.msg,
    required this.time,
  }) : super(key: key);

  final bool isSender;
  final String msg;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: isSender
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15))
                      : const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
              padding: const EdgeInsets.all(15),
              child: Text(
                "$msg",
                style: const TextStyle(color: Colors.white),
              )),
          const SizedBox(height: 5),
          Text(DateFormat.jm().format(DateTime.parse(time))),
        ],
      ),
    );
  }
}
