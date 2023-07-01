import 'package:flutter/material.dart';
import 'package:sushi_shop_project/util/pasta_card.dart';

class PastaCardBody extends StatelessWidget {
  PastaCardBody({Key? key}) : super(key: key);

  final List PastaCardList = [
    {
      "name": "Pasta 1",
      "price": 12.50,
      "rating": 4.0,
      "image": "assets/images/pasta_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
    {
      "name": "Pasta 2",
      "price": 17.90,
      "rating": 5.0,
      "image": "assets/images/pasta_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
    {
      "name": "Pasta 3",
      "price": 14.20,
      "rating": 4.2,
      "image": "assets/images/pasta_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: PastaCardList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var dish = PastaCardList[index];
          return PastaCard(
            nameDish: dish["name"],
            price: dish["price"],
            rating: dish["rating"],
            imagePastaCard: dish["image"],
            description: dish["description"],
          );
        },
      ),
    );
  }
}
