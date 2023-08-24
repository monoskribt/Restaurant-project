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

  double get totalWithTips => itemsTotal + tax + tips;

  void updateTotal() {
    _total = itemsTotal + tax;

  }
  void updateTax(double newTax) {
    _tax = newTax;
  }

  void updateItemsTotal(double newItemsTotal) {
    _itemsTotal = newItemsTotal;
  }

  void updateTips(double newTips) {
    _tips = newTips;
    notifyListeners();
  }

  void newTotalPlusTips() {
    _total = itemsTotal + tax + tips;
  }

  void newSubTotal() {
    _subTotal = itemsTotal + tax;
  }
}