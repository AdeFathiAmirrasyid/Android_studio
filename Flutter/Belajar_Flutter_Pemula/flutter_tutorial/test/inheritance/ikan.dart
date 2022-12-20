import 'animal.dart';

class Ikan extends Animal {
  int kecepatanBerenang;

  Ikan(
      {required this.kecepatanBerenang,
        required int berat})
      : super(name: "Ikan", kategory: "Hewan Laut", berat: berat);
}