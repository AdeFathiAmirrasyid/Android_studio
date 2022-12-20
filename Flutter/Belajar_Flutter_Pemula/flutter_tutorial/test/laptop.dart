class Laptop {
  String? merek;
  String? warna;
  int? _price;

  Laptop({this.merek, this.warna, int? price}) {
    _price = price;
  }

  int? get getPrice {
    return _price;
  }

  set setPrice(int? newPrice) {
    _price = newPrice;
  }
}
