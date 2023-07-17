import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddPegawaiController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingAddPegawai = false.obs;
  TextEditingController nipController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordAdminController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> prosesAddPegawai() async {
    if (passwordAdminController.text.isNotEmpty) {
      isLoadingAddPegawai.value = true;
      try {
        String emailAdmin = auth.currentUser!.email!;
        UserCredential userCredentialAdmin =
            await auth.signInWithEmailAndPassword(
                email: emailAdmin, password: passwordAdminController.text);
        UserCredential pegawaiCredential =
            await auth.createUserWithEmailAndPassword(
                email: emailController.text, password: "password");

        if (pegawaiCredential.user != null) {
          String uid = pegawaiCredential.user!.uid;
          await firestore.collection("pegawai").doc(uid).set({
            "uid": uid,
            "nip": nipController.text,
            "name": nameController.text,
            "job": jobController.text,
            "email": emailController.text,
            "role": "pegawai",
            "createdAt": DateTime.now().toIso8601String(),
          });

          await pegawaiCredential.user!.sendEmailVerification();
          await auth.signOut();
          UserCredential userCredentialAdmin =
              await auth.signInWithEmailAndPassword(
                  email: emailAdmin, password: passwordAdminController.text);
          Get.back();
          Get.back();
          Get.snackbar("Berhasil", "Berhasil menambahkan pegawai");
        }
        isLoadingAddPegawai.value = false;
      } on FirebaseAuthException catch (e) {
        isLoadingAddPegawai.value = false;
        if (e.code == 'weak-password') {
          Get.snackbar(
              "Terjadi Kesalahan", "Password yang digunakan terlalu singkat");
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar("Terjadi Kesalahan",
              "Pegawai sudah ada, Kamu tidak dapat menambahkan pegawai dengan email ini.");
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              "Terjadi Kesalahan", "Admin tidak dapat login, Password salah!");
        } else {
          Get.snackbar("Terjadi Kesalahan", e.code);
        }
      } catch (e) {
        isLoadingAddPegawai.value = false;
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat menambahkan pegawai.");
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
          "Terjadi Kesalahan", "Password wajib diisi untuk keperluan validasi");
    }
  }

  Future<void> addPegawai() async {
    if (nipController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        jobController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      isLoading.value = true;
      Get.defaultDialog(
          title: "Validasi Admin",
          content: Column(
            children: [
              const Text("Masukan password untuk validasi admin!"),
              const SizedBox(height: 10),
              TextField(
                controller: passwordAdminController,
                autocorrect: false,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
          actions: [
            OutlinedButton(
                onPressed: () {
                  isLoading.value = false;
                  Get.back();
                },
                child: const Text("CANCEL")),
            Obx(
              () => ElevatedButton(
                  onPressed: () async {
                    if (isLoadingAddPegawai.isFalse) {
                      await prosesAddPegawai();
                    }
                    isLoading.value = false;
                  },
                  child: Text(isLoadingAddPegawai.isFalse
                      ? "ADD PEGAWAI"
                      : "LOADING..")),
            )
          ]);
    } else {
      Get.snackbar("Terjadi Kesalahan", "NIP, nama, job dan email harus diisi");
    }
  }
}
