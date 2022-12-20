import 'package:flutter_tutorial/equatable/people.dart';

void main(){
  var people1 = People(name: "Diah Insani", age: 24);
  var people2 = People(name: "Fathi Insani", age: 28);
  var people3 = People(name: "Diah Insani", age: 24);

  if(people1 == people3){
    print("Sama");
  }else{
    print("Tidak Sama");
  }
}