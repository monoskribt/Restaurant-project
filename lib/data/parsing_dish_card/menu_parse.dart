import 'package:flutter/services.dart';
import 'package:sushi_shop_project/data/parsing_dish_card/category_parse.dart';
import 'package:sushi_shop_project/data/parsing_dish_card/dish_parse.dart';
import 'package:xml/xml.dart' as xml;

class MenuParse {
  final List<CategoryParse> categories;

  MenuParse({required this.categories});

  Future<MenuParse> parseXmlFile() async {
    final String xmlString = await rootBundle.loadString('assets/data_xml/data.xml');
    final document = xml.XmlDocument.parse(xmlString);

    List<CategoryParse> categories = [];
    for(var categoryParagraph in document.findAllElements('category')) {
      final categoryId = categoryParagraph.getAttribute('id') ?? '';
      final categoryName = categoryParagraph.getAttribute('name') ?? '';

      List<DishParse> dishes = [];
      for(var dishParagraph in categoryParagraph.findAllElements('dish')) {
        final dishId = dishParagraph.getAttribute('id') ?? '';
        final title = dishParagraph.findElements('title').first.text;
        final price = double.parse(dishParagraph.findElements('price').first.text);
        final image = dishParagraph.findElements('images').first.text;
        final description = dishParagraph.findElements('description').first.text;

        final dish = DishParse(
            id: dishId,
            title: title,
            price: price,
            description: description,
            image: image
        );
        dishes.add(dish);
      }
      final category = CategoryParse(
          id: categoryId,
          name: categoryName,
          dishes: dishes
      );
      categories.add(category);
    }
    return MenuParse(categories: categories);
  }
}
