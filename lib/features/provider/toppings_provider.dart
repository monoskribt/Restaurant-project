import 'package:flutter/material.dart';

class ToppingsProvider extends ChangeNotifier {
  int quantity = 0;
  Map<String, double> selectedToppings = {};


  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
    notifyListeners();
  }

  void addToppings(String name, double price) {
    if (quantity > 0) {
      selectedToppings[name] = price;
      notifyListeners();
    }
  }

  void removeToppings(String name) {
    selectedToppings.remove(name);
    notifyListeners();
  }

  bool isSelected(String name) {
    return selectedToppings.containsKey(name);
  }

  double getTotalPrice(double basePrice) {
    if (selectedToppings.isEmpty || basePrice <= 0 || quantity <= 0) {
      return basePrice;
    }

    double toppingsPrice = 0;
    selectedToppings.forEach((name, price) {
      toppingsPrice += price;
    });

    double totalPrice = basePrice + toppingsPrice;
    return totalPrice;

  }

}
