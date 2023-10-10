import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_components/ingredients_card.dart';


class IngredientsListComponent extends StatelessWidget {
  IngredientsListComponent({Key? key}) : super(key: key);

  final List ingredientsList = [
    {
      "title": "Egg",
      "image": "assets/images/ingredient_egg.png",
    },
    {
      "title": "Avocado",
      "image": "assets/images/ingredient_avocado.png",
    },
    {
      "title": "Spinach",
      "image": "assets/images/ingredient_spinach.png",
    },
    {
      "title": "Bread",
      "image": "assets/images/ingredient_spinach.png",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: ingredientsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var ingredient = ingredientsList[index];
          return IngredientsCard(
              title: ingredient["title"],
              imageIngredients: ingredient["image"],
          );
        },
      ),
    );
  }
}
