import 'package:flutter/material.dart';

import '../order_widget/tools/order_model.dart';

class OrderProvider extends ChangeNotifier {
  final double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;


  final Map<String, OrderModel> _orderMap = {};

  Map<String, OrderModel> get orderMap => _orderMap;

  void addToOrder(OrderModel order) {
    _orderMap[order.name] = order;
    notifyListeners();
  }

  void removeFromOrder(String name) {
    _orderMap.remove(name);
    notifyListeners();
  }

  void updateQuantity(String name, int newQuantity) {
    if (_orderMap.containsKey(name)) {
      _orderMap[name]!.quantity = newQuantity;
      notifyListeners();
    }
  }
}
