import 'package:app/introduction_screen/pages/home_page.dart';
import 'package:app/introduction_screen/pages/introduction_page.dart';
import 'package:app/introduction_screen/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroductionPage.routeName,
      routes: {
        IntroductionPage.routeName: (context) => IntroductionPage(),
        HomePages.routeName: (context) => HomePages(),
        LoginPage.routeName: (context) => LoginPage(

        ),
      },
      // home: IntroductionPage(),
    );
  }
}
