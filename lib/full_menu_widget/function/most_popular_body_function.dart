import 'package:flutter/material.dart';
import 'package:sushi_shop_project/full_menu_widget/util/most_popular_card.dart';
class MostPopularBody extends StatelessWidget {
  MostPopularBody({Key? key}) : super(key: key);

  final List mostPopular = [
    {
      "name": "Egg Toast",
      "price": 10.40,
      "rating": 4.0,
      "image": "assets/images/most_popular_1.png",
      "description": "You won't skip the most important meal of the day with this avocado toast recipe."
          "Crispy, lacy eggs and creamy avocado top hot buttered toast. .",
    },
    {
      "name": "Power Bowl",
      "price": 14.10,
      "rating": 5.0,
      "image": "assets/images/most_popular_2.png",
      "description": "A nutritious power bowl packed with healthy ingredients.",
    },
    {
      "name": "Power Bowl",
      "price": 11.10,
      "rating": 4.2,
      "image": "assets/images/most_popular_2.png",
      "description": "A nutritious power bowl packed with healthy ingredients.",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: mostPopular.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var dish = mostPopular[index];
          return MostPopularCard(
            nameDish: dish["name"],
            price: dish["price"],
            rating: dish["rating"],
            imageMostPopular: dish["image"],
            description: dish["description"],
          );
        },
      ),
    );
  }
}

