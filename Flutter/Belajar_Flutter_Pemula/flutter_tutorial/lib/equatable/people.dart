import 'package:equatable/equatable.dart';

class People extends Equatable{
  String name;
  int age;

  People({this.name = '', this.age = 0});

  @override
  List<Object?> get props => [name,age];


  //Equatable untuk membandingkan antara object

  // Cara Manual Untuk membadingkan class string
  // @override
  // operator ==(other) {
  //   if (other is People && other.name == name && other.age == age) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // @override
  // // TODO: implement hashCode
  // int get hashCode => super.hashCode;

}
