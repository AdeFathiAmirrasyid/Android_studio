import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatRoomController extends GetxController {
  var isShowEmoji = false.obs;
  int totalUnread = 0;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late FocusNode focusNode;
  late TextEditingController chatController;
  late ScrollController scrollController;

  Stream<DocumentSnapshot<Object?>> streamFriendData(String friendEmail) {
    CollectionReference users = firestore.collection("users");
    return users.doc(friendEmail).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamChats(String chat_id) {
    CollectionReference chats = firestore.collection("chats");
    return chats.doc(chat_id).collection("chat").orderBy("time").snapshots();
  }

  void addEmojiToChat(Emoji emoji) {
    chatController.text = chatController.text + emoji.emoji;
  }

  void deleteEmoji() {
    chatController.text =
        chatController.text.substring(0, chatController.text.length - 2);
  }

  void newChat(String email, Map<String, dynamic> argument, String chat) async {
    if (chat != "") {
      CollectionReference chats = firestore.collection("chats");
      CollectionReference users = firestore.collection("users");
      String date = DateTime.now().toIso8601String();
      await chats.doc(argument["chat_id"]).collection("chat").add({
        "pengirim": email,
        "penerima": argument["friendEmail"],
        "msg": chat,
        "time": date,
        "isRead": false,
        "groupTime": DateFormat.yMMMMd('en_US').format(DateTime.parse(date))
      });

      Timer(
        Duration.zero,
        () =>
            scrollController.jumpTo(scrollController.position.maxScrollExtent),
      );
      chatController.clear();

      await users
          .doc(email)
          .collection("chats")
          .doc(argument["chat_id"])
          .update({
        "lastTime": date,
      });

      final checkChatFriend = await users
          .doc(argument["friendEmail"])
          .collection("chats")
          .doc(argument["chat_id"])
          .get();

      if (checkChatFriend.exists) {
        // ini ada data chat di temen kita
        // exist on friend DB
        final checkTotalUnread = await chats
            .doc(argument["chat_id"])
            .collection("chat")
            .where("isRead", isEqualTo: false)
            .where("pengirim", isEqualTo: email)
            .get();

        // total unread for friend
        totalUnread = checkTotalUnread.docs.length;

        // update
        print(totalUnread);
        await users
            .doc(argument["friendEmail"])
            .collection("chats")
            .doc(argument["chat_id"])
            .update({
          "lastTime": date,
          "total_unread": totalUnread,
        });
      } else {
        // new for friend database
        // not exist on friend DB
        await users
            .doc(argument["friendEmail"])
            .collection("chats")
            .doc(argument["chat_id"])
            .set({
          "connection": email,
          "lastTime": date,
          "total_unread": 1,
        });
      }
    }
  }

  @override
  void onInit() {
    chatController = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isShowEmoji.value = false;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
