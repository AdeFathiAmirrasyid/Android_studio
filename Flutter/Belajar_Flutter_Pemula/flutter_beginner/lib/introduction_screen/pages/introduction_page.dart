import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

class IntroductionPage extends StatelessWidget {
  static const routeName = '/';
  List<PageViewModel> listIntroduction = [
    PageViewModel(
        title: "Title of introduction page",
        body: "Welcome to the app! This is a description of how it works.",
        image: SizedBox(
          width: 250,
          height: 250,
          child: Lottie.asset("assets/lottie/login.json"),
        )),
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: SizedBox(
        width: 250,
        height: 250,
        child: Lottie.asset("assets/lottie/register.json"),
      ),
    ),
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: SizedBox(
        width: 250,
        height: 250,
        child: Lottie.asset("assets/lottie/secure.json"),
      ),
    ),
  ];

  IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: listIntroduction,
        showSkipButton: true,
        showNextButton: false,
        skip: const Text("Skip"),
        done: const Text("Login"),
        onDone: () {
          Navigator.pushNamed(context, LoginPage.routeName);
        },
      ),
    );
  }
}
