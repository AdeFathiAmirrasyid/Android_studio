import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_firebase/app/controllers/auth_controller.dart';
import 'package:project_firebase/app/utils/loading.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: Routes.QUERY,
      getPages: AppPages.routes,
    );
  }
}

// class MyApp extends StatelessWidget {
//   final authController = Get.put(AuthController(), permanent: true);
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: authController.streamAuthStatus,
//       builder: (context, snapshot) {
//         print(snapshot);
//         if (snapshot.connectionState == ConnectionState.active) {
//           return GetMaterialApp(
//             title: "Application",
//             initialRoute: snapshot.data != null && snapshot.data!.emailVerified == true ? Routes.HOME : Routes.LOGIN,
//             getPages: AppPages.routes,
//           );
//         } else {
//           return const LoadingView();
//         }
//       },
//     );
//   }
// }
