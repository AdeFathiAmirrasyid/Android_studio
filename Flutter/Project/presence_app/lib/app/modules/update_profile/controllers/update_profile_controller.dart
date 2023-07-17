import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;

class UpdateProfileController extends GetxController {
  TextEditingController nipController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordAdminController = TextEditingController();
  RxBool isLoading = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;

  XFile? image;

  final ImagePicker picker = ImagePicker();
  void pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  Future<void> updateProfile(String uid) async {
    if (nipController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      isLoading.value = true;
      try {
        Map<String, dynamic> data = {
          "name": nameController.text,
        };
        if (image != null) {
          File file = File(image!.path);
          String ext = image!.name.split(".").last;
          await storage.ref('$uid/profile.$ext').putFile(file);
          String urlImage =
              await storage.ref('$uid/profile.$ext').getDownloadURL();
          data.addAll({"profile": urlImage});
        }
        await firestore.collection("pegawai").doc(uid).update(data);
        image = null;
        Get.snackbar("Berhasil", "Berhasil update profile");
      } catch (e) {
        Get.snackbar("Terjadi Ksealahan", "Tidak dapat update profile");
      } finally {
        isLoading.value = false;
      }
    }
  }

  void deleteProfile(String uid) async {
    try {
      await firestore
          .collection("pegawai")
          .doc(uid)
          .update({"profile": FieldValue.delete()});
      Get.back();
      Get.snackbar("Berhasil", "Berhasil delete profile picture");
    } catch (e) {
      Get.snackbar("Terjadi Ksealahan", "Tidak dapat delete profile picture");
    }finally{
      update();
    }
  }
}
