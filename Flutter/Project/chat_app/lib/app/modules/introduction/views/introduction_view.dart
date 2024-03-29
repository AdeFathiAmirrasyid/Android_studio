import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Berinteraksi dengan mudah ",
          body: "Kamu hanya perlu di rumah saja untuk mendapatkan teman baru",
          image: SizedBox(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
            ),
          ),
        ),
        PageViewModel(
          title: "Temukan sahabat baru",
          body:
              "Jika kamu memang jodoh karena aplikasi ini, kami sangat bahagia",
          image: SizedBox(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/ojek.json"),
            ),
          ),
        ),
        PageViewModel(
          title: "Aplikasi bebas biaya",
          body: "Kamu tidak perlu khawatir, aplikasi ini bebas biaya apapun",
          image: SizedBox(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/payment.json"),
            ),
          ),
        ),
        PageViewModel(
          title: "Gabung sekarang juga",
          body:
              "Daftarkan diri kamu untuk menjadi bagian dari kami. Kami akan menghubungkan dengan 1000 taman lainnya.",
          image: SizedBox(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/register.json"),
            ),
          ),
        ),
      ],
      showSkipButton: true,
      skip: Text("Skip",
          style:
              TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
      next: Text(
        "Next",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
      done: Text("Login",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Get.isDarkMode ? Colors.white : Colors.black)),
      onDone: () => Get.offAllNamed(Routes.LOGIN),
    ));
  }
}
