import 'package:flutter/material.dart';

class OrderTimeProvider with ChangeNotifier {
  String _imageAsset = "assets/images/order_status_1.png";
  String get imageAsset => _imageAsset;

  double _orderTime = 0;
  double get orderTime => _orderTime;

  final double _orderTimeEnd = 12;
  double get orderTimeEnd => _orderTimeEnd;

  bool _isShowBottomBar = false;
  bool get isShowBottomBar => _isShowBottomBar;

  set orderTime(double value) {
    _orderTime = value;
    updateImage();
    updateShowBottomBar();
    notifyListeners();
  }


  void updateImage() {
    if (_orderTime >= _orderTimeEnd && _orderTime < _orderTimeEnd + 1) {
      _imageAsset = "assets/images/order_status_2.png";
    } else if (_orderTime >= _orderTimeEnd + 1) {
      _imageAsset = "assets/images/order_status_3.png";
    } else {
      _imageAsset = "assets/images/order_status_1.png";
    }
  }

  void updateShowBottomBar() {
    _isShowBottomBar = _orderTime >= _orderTimeEnd + 1;
  }
}
