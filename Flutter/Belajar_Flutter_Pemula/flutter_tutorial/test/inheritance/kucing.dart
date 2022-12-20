import 'animal.dart';

class Kucing extends Animal {
  int kecepatanLari;
  int jumlahkaki;

  Kucing(
      {required this.kecepatanLari,
      required this.jumlahkaki,
      required int berat})
      : super(name: "Kucing", kategory: "Mamalia", berat: berat);
}
