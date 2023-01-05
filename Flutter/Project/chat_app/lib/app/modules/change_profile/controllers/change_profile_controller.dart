import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfileController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController statusController;
  late ImagePicker imagePicker;

  XFile? pickedImage;

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String?> uploadImage(String uid) async {
    Reference storageRef = storage.ref("$uid.png");
    File file = File(pickedImage!.path);
    try {
      await storageRef.putFile(file);
      final photoUrl = await storageRef.getDownloadURL();
      resetImage();
      return photoUrl;
    } catch (error) {
      print(error);
      return null;
    }
  }

  void resetImage() {
    pickedImage = null;
    update();
  }

  void selectImage() async {
    try {
      final checkDataImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (checkDataImage != null) {
        print(checkDataImage.name);
        print(checkDataImage.path);
        pickedImage = checkDataImage;
      }
      update();
    } catch (error) {
      print(error);
      pickedImage = null;
      update();
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    statusController = TextEditingController();
    imagePicker = ImagePicker();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    statusController.dispose();
    super.onClose();
  }
}
