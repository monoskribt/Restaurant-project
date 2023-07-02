import 'package:flutter/foundation.dart';

class ControllerQuantity extends ChangeNotifier {
  int quantity = 0;

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    if (quantity > 0) {
      quantity--;
      notifyListeners();
    }
  }
}
