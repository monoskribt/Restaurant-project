import 'package:flutter/services.dart';
import 'package:Foodbox/data_parsing/models/toppings_model.dart';
import 'package:xml/xml.dart' as xml;

class ToppingsParse {
  Future<List<ToppingsModel>> parseXmlFile() async {
    String xmlString =
        await rootBundle.loadString('assets/data_xml/toppings.xml');
    final document = xml.XmlDocument.parse(xmlString);

    List<ToppingsModel> parsedToppingsList = [];
    for (var toppingsElement in document.findAllElements('toppings')) {
      final title = toppingsElement.findElements('title').single.text;
      final price =
          double.parse(toppingsElement.findElements('price').single.text);

      final toppings = ToppingsModel(
        title: title,
        price: price,
      );
      parsedToppingsList.add(toppings);
    }

    return parsedToppingsList;
  }
}
