import 'animal.dart';

class Burung extends Animal {
  int kecepatanTerbang;
  int jumlahkaki;

  Burung(
      {required this.kecepatanTerbang,
        required this.jumlahkaki,
        required int berat})
      : super(name: "Kucing", kategory: "Mamalia", berat: berat);
}
