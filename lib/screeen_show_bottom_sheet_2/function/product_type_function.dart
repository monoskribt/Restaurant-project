import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screeen_show_bottom_sheet_2/util_2/product_type_card.dart';

class ProductTypeBody extends StatelessWidget {
  ProductTypeBody({Key? key}) : super(key: key);

  final List productTypeList = [
    {
      "title": "Pizza",
    },
    {
      "title": "Burger",
    },
    {
      "title": "Salad",
    },
    {
      "title": "Soup",
    },
    {
      "title": "Chicken",
    },
    {
      "title": "Grill",
    },
    {
      "title": "Breakfast",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Wrap(
        spacing: 6.0,
        runSpacing: 15.0,
        children: productTypeList.map((type) {
          return ProductTypeCard(
            titleProductType: type["title"],
          );
        }).toList(),
      ),
    );
  }
}
