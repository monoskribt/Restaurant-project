import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;

class RestaurantNameParse {
  RestaurantNameParse();

  Future<List<String>> loadRestaurantsNames() async {
    final xmlString = await rootBundle.loadString('assets/data_xml/restaurant_name.xml');
    final document = xml.XmlDocument.parse(xmlString);
    final restaurantEl = document.findAllElements('restaurant');
    final restaurantNames = restaurantEl.map((element) => element.text).toList();
    return restaurantNames;
  }
}
