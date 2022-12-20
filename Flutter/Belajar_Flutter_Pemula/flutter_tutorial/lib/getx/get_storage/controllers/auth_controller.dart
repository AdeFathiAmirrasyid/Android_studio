import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthControllerStorage extends GetxController {
  var isAuth = false.obs;
  final Map<String, String> _dataUser = {
    'email': 'admin@gmail.com',
    'password': 'admin'
  };

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      middleText: msg,
    );
  }

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      login(data['email'], data['password'], data['rememberme']);
    }
  }

  void login(String email, String pass, bool rememberme) async {
    if (email != '' && pass != '') {
      if (GetUtils.isEmail(email)) {
        if (email == _dataUser['email'] && pass == _dataUser['password']) {
          // Get.offAllNamed(RouteNameStorage.home);
          if (rememberme) {
            //Simpan di storage menggunakan get Storage
            final box = GetStorage();
            box.write('dataUser',
                {'email': email, 'password': pass, 'rememberme': rememberme});
          } else {
            // Hapus Storage
            final box = GetStorage();
            if (box.read('dataUser') != null) {
              box.erase();
            }
          }
          //Berhasil Login
          isAuth.value = true;
        } else {
          dialogError("Data user tidak valid. Gunakan akun lainnya");
        }
      } else {
        dialogError("Email Tidak Valid");
      }
    } else {
      dialogError("Semua data input harus diisi.");
    }
  }

  void logout(bool rememberme) {
    if(rememberme == false){
      // Hapus Storage
      final box = GetStorage();
      if (box.read('dataUser') != null) {
        box.erase();
      }
    }

    isAuth.value = false;
  }
}
