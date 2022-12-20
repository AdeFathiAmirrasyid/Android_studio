import 'package:flutter_tutorial/getx/dasar_getx/models/people_getx.dart';
import 'package:get/get.dart';

class PeopleController extends GetxController {
  var people = PeopleGetX(name: "fathi insani", age: 25).obs;

  // void changeUpperCase(){
  //   people.name.value = people.name.value.toUpperCase();
  // }

  void changeUpperCase() {
    people.update((_) {
      people.value.name = people.value.name.toString().toUpperCase();
    });
  }
}
