import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en' : {
      'title' : 'Hello @name Beli @things',
      'body' : 'You have pushed the button this many times'
    },
    'id' : {
      'title' : 'Halaman Utama',
      'body' : 'Kamu telah menekan tombol sebanyak : '
    },
    'id_BT' : {
      'title' : 'Belah Depan',
      'body' : 'Elu udeh neken ni tombol : '
    }
  };
}
