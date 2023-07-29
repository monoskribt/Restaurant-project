import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<String> selectedCategories = [];

  void choiseCategory(String category) {
    if(selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    }
    else {
      selectedCategories.add(category);
    }
    notifyListeners();
  }
}
