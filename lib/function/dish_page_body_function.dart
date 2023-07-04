import 'package:flutter/cupertino.dart';

import '../util/product_day_card.dart';

class DishPageBody  extends StatelessWidget {
   DishPageBody ({Key? key}) : super(key: key);

  final List productCard = [
    {
      "name": "Avocado Chicken",
      "type": "Salad",
      "price": 10.40,
      "rating": 5.0,
      "image": "assets/images/dish_of_day_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
    {
      "name": "Avocado Chicken",
      "type": "Salad",
      "price": 10.40,
      "rating": 5.0,
      "image": "assets/images/dish_of_day_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
    {
      "name": "Avocado Chicken",
      "type": "Salad",
      "price": 10.40,
      "rating": 5.0,
      "image": "assets/images/dish_of_day_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      width: 380,
      child: ListView.builder(
        itemCount: productCard.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var dish = productCard[index];
          return ProductDayCard(
            nameDishOfDay: dish["name"],
            typeDishOfDay: dish["type"],
            priceDishOfDay: dish["price"],
            ratingDishOfDay: dish["rating"],
            imageDishOfDay: dish["image"],
            descriptionDishOfDay: dish["description"],
          );
        },
      ),
    );
  }
}
