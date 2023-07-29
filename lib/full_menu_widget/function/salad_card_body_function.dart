import 'package:flutter/material.dart';

import '../util/salad_card.dart';

class SaladCardBody extends StatelessWidget {
  SaladCardBody({Key? key}) : super(key: key);

  final List saladCardList = [
    {
      "name": "Salad 1",
      "price": 11.40,
      "image": "assets/images/salad_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
    {
      "name": "Salad 2",
      "price": 12.20,
      "image": "assets/images/salad_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
    {
      "name": "Salad 3",
      "price": 13.30,
      "image": "assets/images/salad_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: saladCardList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var dish = saladCardList[index];
            return SaladCard(
              nameDish: dish["name"],
              price: dish["price"],
              imageSaladCard: dish["image"],
              description: dish["description"],
            );
          },
        )
    );
  }
}
