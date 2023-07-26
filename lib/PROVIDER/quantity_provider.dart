import 'package:flutter/material.dart';

class QuantityProvider extends ChangeNotifier {
  int quantity = 0;

  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
    notifyListeners();
  }
}
