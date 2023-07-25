import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../order_widget/tools/order_model.dart';


class OrderProvider extends ChangeNotifier {
  List<OrderModel> _orderList = [];

  List<OrderModel> get orderList => _orderList;

  // Метод для добавления блюда в заказ
  void addToOrder(OrderModel order) {
    _orderList.add(order);
    notifyListeners();
  }

  // Метод для удаления блюда из заказа
  void removeFromOrder(int index) {
    _orderList.removeAt(index);
    notifyListeners();
  }
}