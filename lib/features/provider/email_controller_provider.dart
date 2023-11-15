import 'package:flutter/cupertino.dart';

class EmailControllerProvider with ChangeNotifier {
  String _email = '';
  String get email => _email;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void clearEmailController() {
    _email = '';
    notifyListeners();
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(value);
  }
}
