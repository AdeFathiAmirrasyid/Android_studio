import 'package:app/latihan_flutter_basic/ui/soal_1.dart';
import 'package:app/latihan_flutter_basic/ui/soal_10.dart';
import 'package:app/latihan_flutter_basic/ui/soal_11.dart';
import 'package:app/latihan_flutter_basic/ui/soal_12.dart';
import 'package:app/latihan_flutter_basic/ui/soal_13.dart';
import 'package:app/latihan_flutter_basic/ui/soal_14.dart';
import 'package:app/latihan_flutter_basic/ui/soal_15.dart';
import 'package:app/latihan_flutter_basic/ui/soal_16.dart';
import 'package:app/latihan_flutter_basic/ui/soal_17.dart';
import 'package:app/latihan_flutter_basic/ui/soal_18.dart';
import 'package:app/latihan_flutter_basic/ui/soal_19.dart';
import 'package:app/latihan_flutter_basic/ui/soal_2.dart';
import 'package:app/latihan_flutter_basic/ui/soal_20.dart';
import 'package:app/latihan_flutter_basic/ui/soal_21.dart';
import 'package:app/latihan_flutter_basic/ui/soal_22.dart';
import 'package:app/latihan_flutter_basic/ui/soal_23.dart';
import 'package:app/latihan_flutter_basic/ui/soal_24.dart';
import 'package:app/latihan_flutter_basic/ui/soal_25.dart';
import 'package:app/latihan_flutter_basic/ui/soal_3.dart';
import 'package:app/latihan_flutter_basic/ui/soal_4.dart';
import 'package:app/latihan_flutter_basic/ui/soal_5.dart';
import 'package:app/latihan_flutter_basic/ui/soal_6.dart';
import 'package:app/latihan_flutter_basic/ui/soal_7.dart';
import 'package:app/latihan_flutter_basic/ui/soal_8.dart';
import 'package:app/latihan_flutter_basic/ui/soal_9.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: FlutterLogo(),
        ),
        title: const Text("Latihan Flutter Basic"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),

      body: SoalDuaPuluhLima(),
    );
  }
}
