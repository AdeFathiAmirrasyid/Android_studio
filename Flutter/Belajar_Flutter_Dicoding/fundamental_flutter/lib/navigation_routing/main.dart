import 'package:flutter/material.dart';
import 'package:fundamental_flutter/navigation_routing/replacement_screen.dart';

import 'package:fundamental_flutter/navigation_routing/return_data_another_screen.dart';
import 'package:fundamental_flutter/navigation_routing/second_screen.dart';

import 'package:fundamental_flutter/navigation_routing/second_screen_with_data.dart';

import 'another_screen.dart';
import 'first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation & Routing",
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/secondScreen': (context) => const SecondScreen(),
        '/secondScreenWithData': (context) => SecondScreenWithData(
            ModalRoute.of(context)?.settings.arguments as String),
        '/returnDataScreen': (context) => const ReturnDataAnotherScreen(),
        '/replacementScreen': (context) => const ReplacementScreen(),
        '/anotherScreen': (context) => const AnotherScreen(),
      },
    );
  }
}
