import 'package:flutter/cupertino.dart';

class OrderTotalProvider extends ChangeNotifier {
  double _total = 0.0;
  double _tax = 0.0;
  double _itemsTotal = 0.0;
  double _tips = 0.0;
  double _subTotal = 0.0;

  double get total => _total;

  double get tax => _tax;

  double get itemsTotal => _itemsTotal;

  double get tips => _tips;

  double get subTotal => _subTotal;

  void updateTotal(double newTotal) {
    _total = itemsTotal + tax;
    notifyListeners();
  }

  void updateTax(double newTax) {
    _tax = newTax;
    notifyListeners();
  }

  void updateItemsTotal(double newItemsTotal) {
    _itemsTotal = newItemsTotal;
    notifyListeners();
  }

  void updateTips(double newTips) {
    _tips = newTips;
    notifyListeners();
  }

  void newTotalPlusTips() {
    _total = itemsTotal + tax + tips;
    notifyListeners();
  }

  void newSubTotal() {
    _subTotal = itemsTotal + tax;
    notifyListeners();
  }
}