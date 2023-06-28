import 'package:flutter/material.dart';
import 'package:sushi_shop_project/util/most_popular_card.dart';

class MostPopularBody extends StatelessWidget {
  MostPopularBody({Key? key}) : super(key: key);

  final List mostPopular = [
    ["Egg Test", 10.40, 4.0, "assets/images/most_popular_1.jpg"],
    ["Power Bowl", 14.10, 5.0, "assets/images/most_popular_2.jpg"],
    ["Power Bowl", 11.10, 4.2, "assets/images/most_popular_2.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: mostPopular.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return MostPopularCard(
              nameDish: mostPopular[index][0],
              price: mostPopular[index][1],
              rating: mostPopular[index][2],
              imageMostPopular: mostPopular[index][3],
            );
          },
        )
    );
  }
}
