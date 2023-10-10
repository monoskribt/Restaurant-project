import 'package:flutter/cupertino.dart';

class RequestProvider extends ChangeNotifier {
  String _request = '';
  String get request => _request;

  void updateRequest(String newRequest) {
    _request = newRequest;
    notifyListeners();
  }
}