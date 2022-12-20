import 'laptop.dart';

void main() {
  var laptop1 = Laptop(merek: "Asus", warna: "Red", price: 10000);
  print("Laptop ${laptop1.merek} => Warna ${laptop1.warna}, Harga : ${laptop1.getPrice}");
  print("Ganti Laptop");
  laptop1.setPrice = 2000000;
  print("Laptop ${laptop1.merek} => Warna ${laptop1.warna}, Harga : ${laptop1.getPrice}");




}

