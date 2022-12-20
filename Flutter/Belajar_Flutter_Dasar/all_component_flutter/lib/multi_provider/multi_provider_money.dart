import 'package:flutter/foundation.dart';

class MultiProviderMoney with ChangeNotifier {
  int _belance = 10000;

  int get belance => _belance;

  set belance(int value) {
    _belance = value;
    notifyListeners();
  }
}
