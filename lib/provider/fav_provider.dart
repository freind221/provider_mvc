import 'package:flutter/foundation.dart';

class FavProvider with ChangeNotifier {
  List<int> selectedItem = [];

  void setItem(int index) {
    selectedItem.add(index);
    notifyListeners();
  }

  void remove(int index) {
    selectedItem.remove(index);
    notifyListeners();
  }
}
