import 'package:chat_app/app/data/models/users_model_model.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;

  var userModel = UsersModel().obs;

  FirebaseFirestore? fireStore = FirebaseFirestore.instance;

  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });

    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
  }

  Future<bool> skipIntro() async {
    // kita akan mengubah isAuth => true
    final box = GetStorage();
    if (box.read('skipIntro') != null || box.read('skipIntro') == true) {
      return true;
    }
    return false;
  }

  Future<bool> autoLogin() async {
    // kita akan mengubah isSkipIntro => true -> AutoLogin
    try {
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        await _googleSignIn
            .signInSilently()
            .then((value) => _currentUser = value);
        // Digunakan untuk mendapatkan google account
        final googleAuth = await _currentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        // Masukan data ke firebase
        CollectionReference users = fireStore!.collection('users');
        await users.doc(_currentUser!.email).update({
          "lastSignInTime":
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });

        final currentUser = await users.doc(_currentUser!.email).get();
        final currentUserData = currentUser.data() as Map<String, dynamic>;

        userModel(UsersModel.fromJson(currentUserData));
        userModel.refresh();

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();
        if (listChats.docs.isNotEmpty) {
          List<ChatUser> dataListChats = [];

          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });
          userModel.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          userModel.update((user) {
            user!.chats = [];
          });
        }
        userModel.refresh();

        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  // Buat function untuk login dengan google
  Future<void> login() async {
    try {
      // Untuk handle kebocoran data user sebelum login
      await _googleSignIn.signOut();

      // Digunakan untuk mendapatkan google account
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      // Untuk mengecek status login user
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        // Login Berhasil
        print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
        print(_currentUser);

        final googleAuth = await _currentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        // Simpan Status User bahwa sudah pernah login dan tidak akan menampilkan introduction
        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);

        // Masukan data ke firebase
        CollectionReference users = fireStore!.collection('users');

        final checkUser = await users.doc(_currentUser!.email).get();
        if (checkUser.data() == null) {
          await users.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentUser!.displayName,
            "keyName": _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            "email": _currentUser!.email,
            "photoUrl": _currentUser!.photoUrl ?? "noimage",
            "status": "",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
          });

          await users.doc(_currentUser!.email).collection("chats");
        } else {
          await users.doc(_currentUser!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final currentUser = await users.doc(_currentUser!.email).get();
        final currentUserData = currentUser.data() as Map<String, dynamic>;

        userModel(UsersModel.fromJson(currentUserData));
        userModel.refresh();

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();
        if (listChats.docs.isNotEmpty) {
          List<ChatUser> dataListChats = [];

          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });
          userModel.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          userModel.update((user) {
            user!.chats = [];
          });
        }
        userModel.refresh();
        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        print("TIDAK BERHASIL LOGIN : ");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  // PROFILE
  void changeProfile(String name, String status) {
    String date = DateTime.now().toIso8601String();
    // Update firebase
    CollectionReference users = fireStore!.collection('users');
    users.doc(_currentUser!.email).update({
      "name": name,
      "keyName": name.substring(0, 1).toUpperCase(),
      "status": status,
      "lastSignInTime":
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
      "updatedTime": date
    });

    // Update model
    userModel.update((user) {
      user!.name = name;
      user.keyName = name.substring(0, 1).toUpperCase();
      user.status = status;
      user.lastSignInTime =
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String();
      user.updatedTime = date;
    });

    userModel.refresh();
    Get.defaultDialog(title: "Success", middleText: "Change Profile Success");
  }

  void updateStatus(String status) {
    String date = DateTime.now().toIso8601String();
    // Update firebase
    CollectionReference users = fireStore!.collection('users');
    users.doc(_currentUser!.email).update({
      "status": status,
      "lastSignInTime":
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
      "updatedTime": date
    });

    // Update model
    userModel.update((user) {
      user!.status = status;
      user.lastSignInTime =
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String();
      user.updatedTime = date;
    });

    userModel.refresh();
    Get.defaultDialog(title: "Success", middleText: "Update Status Success");
  }

  void updatePhotoUrl(String url) async {
    String date = DateTime.now().toIso8601String();
    // Update firebase
    CollectionReference users = fireStore!.collection('users');
    await users
        .doc(_currentUser!.email)
        .update({"photoUrl": url, "updatedTime": date});

    // Update model
    userModel.update((user) {
      user!.photoUrl = url;
      user.updatedTime = date;
    });

    userModel.refresh();
    Get.defaultDialog(
        title: "Success", middleText: "Change photo profile Success");
  }

  // SEARCH
  void addNewConnection(String friendEmail) async {
    bool flagNewConnection = false;
    var chat_id;
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = fireStore!.collection("chats");
    CollectionReference users = fireStore!.collection("users");

    final docChats =
        await users.doc(_currentUser!.email).collection("chats").get();

    if (docChats.docs.isNotEmpty) {
      // user sudah pernah chat dengan siapapun
      final checkConnection = await users
          .doc(_currentUser!.email)
          .collection("chats")
          .where("connection", isEqualTo: friendEmail)
          .get();

      if (checkConnection.docs.isNotEmpty) {
        // sudah pernah buat koneksi dengan => friendEmail
        flagNewConnection = false;

        //chat_id from chats collection
        chat_id = checkConnection.docs[0].id;
      } else {
        // blm pernah buat koneksi dengan => friendEmail
        // buat koneksi ....
        flagNewConnection = true;
      }
    } else {
      // belum pernah buat connection dengan => friendEmail
      flagNewConnection = true;
    }

    // New Connection
    if (flagNewConnection) {
      // cek dari chats collection => connection => mereka berdua..
      final chatsDocs = await chats.where("connections", whereIn: [
        [
          _currentUser!.email,
          friendEmail,
        ],
        [
          friendEmail,
          _currentUser!.email,
        ],
      ]).get();

      // Cke datanya kosong  atau ga
      if (chatsDocs.docs.isNotEmpty) {
        // terdapat data chats
        final chatDataId = chatsDocs.docs[0].id;
        final chatsData = chatsDocs.docs[0].data() as Map<String, dynamic>;

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(chatDataId)
            .set({
          "connection": friendEmail,
          "lastTime": chatsData["lastTime"],
          "total_unread": 0,
        });

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.isNotEmpty) {
          List<ChatUser> dataListChats = List<ChatUser>.empty();
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });
          userModel.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          userModel.update((user) {
            user!.chats = [];
          });
        }
        chat_id = chatDataId;
        userModel.refresh();
      } else {
        // buat baru, mereka berdua benar2 belum ada koneksi
        final newChatDoc = await chats.add({
          "connections": [
            _currentUser!.email,
            friendEmail,
          ],
        });
        chats.doc(newChatDoc.id).collection("chat");

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(newChatDoc.id)
            .set({
          "connection": friendEmail,
          "lastTime": date,
          "total_unread": 0,
        });

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.isNotEmpty) {
          List<ChatUser> dataListChats = List.empty(growable: true);
          for (var element in listChats.docs) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          }
          userModel.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          userModel.update((user) {
            user!.chats = [];
          });
        }
        chat_id = newChatDoc.id;
        userModel.refresh();
      }
    }
    print(chat_id);

    final updateStatusChat = await chats
        .doc(chat_id)
        .collection("chat")
        .where("isRead", isEqualTo: false)
        .where("penerima", isEqualTo: _currentUser!.email)
        .get();

    updateStatusChat.docs.forEach((element) async {
      element.id;
      await chats
          .doc(chat_id)
          .collection("chat")
          .doc(element.id)
          .update({"isRead": true});
    });

    await users
        .doc(_currentUser!.email)
        .collection("chats")
        .doc(chat_id)
        .update({"total_unread": 0});

    Get.toNamed(Routes.CHAT_ROOM,
        arguments: {"chat_id": "$chat_id", "friendEmail": friendEmail});
  }
}
