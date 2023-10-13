import 'package:flutter/services.dart';
import 'package:sushi_shop_project/models/dish_model_for_search.dart';
import 'package:xml/xml.dart' as xml;

class DishDataForSearch {
  static List<DishSearchModel> mainDishList = [];

  static void parseXml(String xmlData) {
    final document = xml.XmlDocument.parse(xmlData);
    mainDishList.clear();

    for (var dishNode in document.findAllElements('dish')) {
      final title = dishNode.findElements('title').first.text;
      final price = double.parse(dishNode.findElements('price').first.text);
      final image = dishNode.findElements('images').first.text;
      final description = dishNode.findElements('description').first.text;

      final dish = DishSearchModel(
          dishTitle: title,
          dishPrice: price,
          dishImage: image,
          description: description);
      mainDishList.add(dish);
    }
  }


  static Future<void> loadMenuFromXml() async {
    String xmlString = await rootBundle.loadString('assets/data_xml/data.xml');
    parseXml(xmlString);
  }
}
