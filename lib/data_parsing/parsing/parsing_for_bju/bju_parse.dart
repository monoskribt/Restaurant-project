import 'package:flutter/services.dart';
import 'package:Foodbox/data_parsing/models/bju_model.dart';
import 'package:xml/xml.dart' as xml;

class BjuParse {
  Future<List<BjuModel>> parseXmlFile() async {
    String xmlString = await rootBundle.loadString('assets/data_xml/bju.xml');
    final document = xml.XmlDocument.parse(xmlString);

    List<BjuModel> parsedBjuList = [];
    for(var bjuElement in document.findAllElements('bju')) {
      final title = bjuElement.findElements('title').first.text;
      final value = int.parse(bjuElement.findElements('value').single.text);

      final bju = BjuModel(
          title: title,
          value: value
      );
      parsedBjuList.add(bju);
    }
    return parsedBjuList;
  }
}