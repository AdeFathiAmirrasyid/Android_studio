import 'animal.dart';
import 'ikan.dart';
import 'kucing.dart';

void main(){
Kucing  kucing = Kucing(berat: 20,jumlahkaki: 4,kecepatanLari: 10);
print("Kucing : ${kucing.name} - ${kucing.kategory}");
print("${kucing.berat} Kg");
print("Kecepatan Berlari ${kucing.kecepatanLari} m/s");
print("${kucing.jumlahkaki} Kaki");
var add = kucing.makan = 10;
print("---------- Makan ${add} ----------");
print("${kucing.berat}");


Ikan ikan = Ikan(berat: 20,kecepatanBerenang: 30);
print("Ikan : ${ikan.name} - ${ikan.kategory}");
print("${ikan.berat} Kg");
print("Kecepatan Berenang ${ikan.kecepatanBerenang} m/s");
var add_i = kucing.makan = 20;
print("---------- Makan ${add_i} ----------");
print("${ikan.berat}");
}