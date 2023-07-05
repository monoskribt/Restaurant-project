import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sushi_shop_project/filters_widget/util/categories_card.dart';

class CategoriesBody extends StatelessWidget {
  CategoriesBody({Key? key}) : super(key: key);

  final List categoriesList = [
    {
      "title": "Food",
    },
    {
      "title": "Drink",
    },
    {
      "title": "Desert",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
          var categories = categoriesList[index];
            return CategoriesCard(
            titleCategories: categories["title"],
            );
          }
      ),
    );
  }
}
