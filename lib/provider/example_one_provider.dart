import 'package:flutter/foundation.dart';

class ExampleOneProvider with ChangeNotifier {
  double _val = 1.0;
  double get val => _val;

  void setState(double value) {
    _val = value;
    notifyListeners();
  }
}
