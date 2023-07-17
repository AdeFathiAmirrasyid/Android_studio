import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

class NewPasswordController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  void newPassword() async {
    if (newPasswordController.text.isNotEmpty) {
      if (newPasswordController.text != "password") {
        try{
          String email = auth.currentUser!.email!;
          await auth.currentUser!.updatePassword(newPasswordController.text);
          await auth.signOut();
          await auth.signInWithEmailAndPassword(
              email: email, password: newPasswordController.text);
          Get.offAllNamed(Routes.HOME);
        } on FirebaseAuthException catch(e){
          if (e.code == 'weak-password') {
            Get.snackbar("Terjadi Kesalahan", "Password terlalu lemah, setidaknya 6 karakter.");
          }
        }catch(e){
            Get.snackbar("Terjadi Kesalahan", "Tidak dapat membuat password baru. Hubungi admin / customer service.");
        }
      } else {
        Get.snackbar("Terjadi Kesalahan",
            "Password baru harus di ubah, jangan 'password' kembali");
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Password baru wajib diisi");
    }
  }
}
