import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified == true) {
            isLoading.value = false;
            if (passwordController.text == "password") {
              Get.offAllNamed(Routes.NEW_PASSWORD);
            } else {
              Get.offAllNamed(Routes.HOME);
            }
          } else {
            Get.defaultDialog(
                title: "Belum Verifikasi",
                middleText:
                    "Kamu belum verifikasi akun ini. Lakukan verifikasi diemail kamu.",
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        isLoading.value = false;
                        Get.back();
                      },
                      child: Text("CANCEL")),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          await userCredential.user!.sendEmailVerification();
                          Get.back();
                          Get.snackbar("Berhasil",
                              "Kami telah berhahil mengirim email verifikasi ke akun kamu.");
                          isLoading.value = false;
                        } catch (error) {
                          isLoading.value = false;
                          Get.snackbar("Terjadi Kesalahan",
                              "Tidak dapat mengirim email verifikasi. Hubungi admin atau customer service.");
                        }
                      },
                      child: Text("KIRIM ULANG")),
                ]);
          }
        }
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == 'user-not-found') {
          Get.snackbar("Terjadi Kesalahan", "Email tidak terdaftar");
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Terjadi Kesalahan", "Password salah");
          print('Wrong password provided for that user.');
        }
      } catch (error) {
        isLoading.value = false;
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat login");
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Email dan password wajib diisi.");
    }
  }
}
