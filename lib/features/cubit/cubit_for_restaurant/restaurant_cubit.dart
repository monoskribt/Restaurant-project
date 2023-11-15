import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_shop_project/data_parsing/parsing/parsing_for_search_dish/dish_data_for_search_parse.dart';
import 'package:xml/xml.dart' as xml;

class RestaurantCubit extends Cubit<String> {
  RestaurantCubit() : super("Gram Bistro") {
    if (state == null) {
      selectRestaurant("Gram Bistro");
    }
  }

  void selectRestaurant(String restaurantName) {
    emit(restaurantName);
    DishDataForSearchParse.loadMenuFromXml(restaurantName);
  }

  Map<String, String> restaurantXmlPaths = {
    "Gram Bistro": 'assets/data_xml/gram_bistro.xml',
    "Gram Bistro-1": 'assets/data_xml/gram_bistro_1.xml',
    "Gram Bistro-2": 'assets/data_xml/gram_bistro_2.xml',
  };

  Future<List<Map<String, dynamic>>?> loadMenuForSelectedRestaurant() async {
    final selectedRestaurant = state;

    if (restaurantXmlPaths.containsKey(selectedRestaurant)) {
      final xmlFilePath = restaurantXmlPaths[selectedRestaurant];

      final xmlString = await rootBundle.loadString(xmlFilePath!);
      final document = xml.XmlDocument.parse(xmlString);

      List<Map<String, dynamic>> menuData = [];

      for (var categoryParagraph in document.findAllElements('category')) {
        final categoryId = categoryParagraph.getAttribute('id') ?? '';
        final categoryName = categoryParagraph.getAttribute('name') ?? '';

        List<Map<String, dynamic>> categoryDishes = [];

        for (var dishParagraph in categoryParagraph.findAllElements('dish')) {
          final dishId = dishParagraph.getAttribute('id') ?? '';
          final title = dishParagraph.findElements('title').first.text;
          final price = double.parse(dishParagraph.findElements('price').first.text);
          final image = dishParagraph.findElements('images').first.text;
          final description = dishParagraph.findElements('description').first.text;

          final dishData = {
            "id": dishId,
            "name": title,
            "price": price,
            "image": image,
            "description": description,
          };
          categoryDishes.add(dishData);
        }

        final categoryData = {
          "id": categoryId,
          "name": categoryName,
          "dishes": categoryDishes,
        };
        menuData.add(categoryData);
      }
      return menuData;
    } else {
      return null;
    }
  }
}
