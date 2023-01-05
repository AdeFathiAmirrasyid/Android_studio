import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

class App extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(
              () => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Chat App",
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                        brightness: Brightness.light,
                        primary: Colors.white,
                        secondary: Colors.black)),
                initialRoute: authController.isSkipIntro.isTrue
                    ? authController.isAuth.isTrue
                        ? Routes.HOME
                        : Routes.LOGIN
                    : Routes.INTRODUCTION,
                getPages: AppPages.routes,
              ),
            );
          }
          return FutureBuilder(
              future: authController.firstInitialized(),
              builder: (context, snapshot) => SplashScreen());
        });
  }
}
