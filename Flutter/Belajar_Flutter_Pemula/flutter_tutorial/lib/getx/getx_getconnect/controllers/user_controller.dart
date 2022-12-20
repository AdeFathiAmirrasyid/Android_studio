import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_connect.dart';
import '../services/users_service.dart';

class UserController extends GetxController {
  var users = List<UserConnect>.empty().obs;

  void snackBarError(String msg) {
    Get.snackbar("Error", msg, duration: Duration(seconds: 2));
  }

  void add(String name, String email, String phone) {
    if (name != '' && email != '' && phone != '') {
      if (email.contains("@")) {
        UserService().postData(name, email, phone).then((value) {
          users.add(UserConnect(
              id: value.body['name'].toString(),
              name: name,
              email: email,
              phone: phone));
        });
        Get.back();
      } else {
        snackBarError("Masukan Email Valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  UserConnect userConnectById(String id) {
    return users.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name, String email, String phone) {
    if (name != '' && email != '' && phone != '') {
      if (email.contains("@")) {
        UserService().editData(id, name, email, phone).then((_) {
          final user = userConnectById(id);
          user.name = name;
          user.email = email;
          user.phone = phone;
          users.refresh();
        });
        Get.back();
      } else {
        snackBarError("Masukan Email Valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  Future<bool> delete(String id) async {
    bool _delete = false;
    await Get.defaultDialog(
        title: "DELETE",
        middleText: "Apakah kamu yakin untuk menghapus data user ini?",
        textConfirm: "Ya",
        confirmTextColor: Colors.white,
        onConfirm: () {
          UserService().deleteData(id).then((_) {
            users.removeWhere((element) => element.id == id);
            _delete = true;
          });
          Get.back();
        },
        textCancel: "No");
    return _delete;
  }
}
