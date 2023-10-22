import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;

class ContactInfoParse {
  static Future<Map<String, String>> loadContactInfo(String selectedRestaurant) async {
    const xmlFilePath = 'assets/data_xml/contacts.xml';
    final xmlString = await rootBundle.loadString(xmlFilePath);
    final document = xml.XmlDocument.parse(xmlString);
    final contactId = selectedRestaurant == 'Gram Bistro'
        ? '1'
        : selectedRestaurant == 'Gram Bistro-1'
        ? '2'
        : '3';

    xml.XmlElement? contactEl;

    try {
      contactEl = document.findAllElements('contact').firstWhere(
              (element) => element.getAttribute('id') == contactId);
    } catch (e) {
      contactEl = null;
    }

    if (contactEl != null) {
      final contactNumber = contactEl.findElements('number').first.text;
      final contactEmail = contactEl.findElements('email').first.text;
      final contactAddress = contactEl.findElements('address').first.text;

      return {
        'number': contactNumber,
        'email': contactEmail,
        'address': contactAddress,
      };
    }

    return {
      "number": "",
      "email": "",
      "address": "",
    };
  }
}
