import 'package:flutter/cupertino.dart';

class OrderTotalProvider extends ChangeNotifier {
  double _total = 0.0;
  double _itemsTotal = 0.0;
  double _tips = 0.0;
  double _subTotal = 0.0;

  double get total => _total;
  double get itemsTotal => _itemsTotal;
  double get tips => _tips;
  double get subTotal => _subTotal;

  double get tax => itemsTotal * 0.1;

  double get totalWithTips => itemsTotal + tax + tips;

  double updateTotal() {
    _total = itemsTotal + tax;
    return _total;
  }

  void updateItemsTotal(double newItemsTotal) {
    _itemsTotal = newItemsTotal;
    updateTotal();
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

  void clear() {
    _total = 0.0;
    _itemsTotal = 0.0;
    _tips = 0.0;
    _subTotal = 0.0;
    notifyListeners();
  }
}
