import 'package:flutter/services.dart';
import 'package:Foodbox/data_parsing/models/ingredients_model.dart';
import 'package:xml/xml.dart' as xml;

class IngredientsParse {
  Future<List<IngredientsModel>> parseXmlFile() async {
    String xmlString = await rootBundle.loadString('assets/data_xml/ingredients.xml');
    final document = xml.XmlDocument.parse(xmlString);

    List<IngredientsModel> parsedIngredientsList = [];
    for(var ingredientsElement in document.findAllElements('ingredients')) {
      final title = ingredientsElement.findElements('title').first.text;
      final image = ingredientsElement.findElements('image').first.text;

      final ingredients = IngredientsModel(
          title: title,
          image: image
      );
      parsedIngredientsList.add(ingredients);
    }
    return parsedIngredientsList;
  }
}