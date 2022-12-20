abstract class Animal {
  String name;
  String kategory;
  late int _berat;

  Animal({required this.name, required this.kategory, required int berat}){
    _berat = berat;
  }

  get berat => _berat;
  set makan(int beratMakan){
    _berat += beratMakan;
  }
}