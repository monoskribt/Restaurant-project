import 'package:flutter/services.dart';
import 'package:sushi_shop_project/models/dish_model_for_search.dart';
import 'package:xml/xml.dart' as xml;

class DishDataForSearchParse {
  static List<DishSearchModel> mainDishList = [];

  static Future<void> loadMenuFromXml([String? selectedRestaurant]) async {
    String xmlFilePath;

    if (selectedRestaurant == null || selectedRestaurant == 'Gram Bistro') {
      xmlFilePath = 'assets/data_xml/gram_bistro.xml';
    } else if (selectedRestaurant == 'Gram Bistro-1') {
      xmlFilePath = 'assets/data_xml/gram_bistro_1.xml';
    } else {
      xmlFilePath = 'assets/data_xml/gram_bistro_2.xml';
    }

    final xmlString = await rootBundle.loadString(xmlFilePath);

    final document = xml.XmlDocument.parse(xmlString);
    final List<DishSearchModel> updatedDishList = [];

    for (var dishNode in document.findAllElements('dish')) {
      final title = dishNode.findElements('title').first.text;
      final price = double.tryParse(dishNode.findElements('price').first.text) ?? 0.0;
      final image = dishNode.findElements('images').first.text;
      final description = dishNode.findElements('description').first.text;

      final dish = DishSearchModel(
        dishTitle: title,
        dishPrice: price,
        dishImage: image,
        description: description,
      );
      updatedDishList.add(dish);

      print('Added dish: $title');
    }

    mainDishList = updatedDishList;
  }
}
