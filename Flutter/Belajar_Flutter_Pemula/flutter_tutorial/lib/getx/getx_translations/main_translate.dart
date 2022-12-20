import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/getx_translations/utils/translation.dart';
import 'package:get/get.dart';

void main() {
  runApp(TranslateApp());
}

class TranslateApp extends StatelessWidget {
  const TranslateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: Locale('en'),
      home: HomePageTranslate(),
    );
  }
}

class HomePageTranslate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('title'.trParams({'name': 'Diah Insani', 'things': 'Accord'})),
        actions: [
          IconButton(
              onPressed: () {
                Get.updateLocale(Locale('id', 'BT'));
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('body'.tr)],
        ),
      ),
    );
  }
}
