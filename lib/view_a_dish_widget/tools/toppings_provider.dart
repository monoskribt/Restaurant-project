import 'package:flutter/material.dart';

class ToppingsProvider extends ChangeNotifier {
  Map<String, double> selectedToppings = {};
  int quantity = 1;



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
    if (quantity <= 0 || basePrice <= 0) {
      return basePrice;
    }

    double toppingsPrice = selectedToppings.values.fold(0, (sum, price) => sum + price);
    double totalPrice = basePrice + toppingsPrice;
    return totalPrice;
  }

}
