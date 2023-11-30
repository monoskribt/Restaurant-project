import 'package:flutter/material.dart';
import 'package:Foodbox/models/order_model.dart';

class OrderProvider extends ChangeNotifier {

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

  bool isDishNameInOrder(String dishName) {
    for (String key in _orderMap.keys) {
      if (_orderMap[key]!.name == dishName) {
        return true;
      }
    }
    return false;
  }
}
