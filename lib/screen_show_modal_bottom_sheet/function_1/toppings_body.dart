import 'package:flutter/cupertino.dart';
import 'package:sushi_shop_project/screen_show_modal_bottom_sheet/util_1/toppings_card.dart';


class ToppingsBody extends StatelessWidget {
  ToppingsBody({Key? key}) : super(key: key);

  final List toppingsIngredientsList = [
    {
      "name": "Extra eggs",
      "price": 4.20,
    },
    {
      "name": "Extra spinach",
      "price": 2.80,
    },
    {
      "name": "Extra bread",
      "price": 1.80,
    },
    {
      "name": "Extra tomato",
      "price": 2.10,
    },
    {
      "name": "Extra cucumber",
      "price": 1.60,
    },
    {
      "name": "Extra olives",
      "price": 3.50,
    },
    {
      "name": "Extra pepper",
      "price": 1.50,
    },
    {
      "name": "Extra avocado",
      "price": 5.40,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: toppingsIngredientsList.length,
        itemBuilder: (context, index) {
          var toppings = toppingsIngredientsList[index];
          return ToppingsCard(
            nameToppings: toppings["name"],
            priceToppings: toppings["price"],
          );
        },
      ),
    );
  }
}
