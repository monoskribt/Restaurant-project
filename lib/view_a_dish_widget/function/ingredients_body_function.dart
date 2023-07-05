import 'package:flutter/material.dart';
import 'package:sushi_shop_project/view_a_dish_widget/util/ingredients_card.dart';


class IngredientsBody extends StatelessWidget {
  IngredientsBody({Key? key}) : super(key: key);

  final List Ingredients = [
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
        itemCount: Ingredients.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var ingredient = Ingredients[index];
          return IngredientsCard(
              title: ingredient["title"],
              imageIngredients: ingredient["image"],
          );
        },
      ),
    );
  }
}
