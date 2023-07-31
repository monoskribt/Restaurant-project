import 'package:flutter/material.dart';
import 'package:sushi_shop_project/filters_widget/util/product_type_card.dart';

class ProductTypeBody extends StatelessWidget {
  ProductTypeBody({Key? key}) : super(key: key);

  final List<Map<String, String>> productTypeList = [
    {"title": "Pizza"},
    {"title": "Burger"},
    {"title": "Salad"},
    {"title": "Soup"},
    {"title": "Chicken"},
    {"title": "Grill"},
    {"title": "Breakfast"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Wrap(
        runSpacing: 15.0,
        spacing: 4.0,
        children: productTypeList.map((productType) {
          final titleProductType = productType['title']!;
          return ProductTypeCard(
            titleProductType: titleProductType,
          );
        }).toList(),
      ),
    );
  }
}
