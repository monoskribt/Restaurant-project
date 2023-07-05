import 'package:flutter/material.dart';
import 'package:sushi_shop_project/filters_widget/util/rating_card.dart';

class RatingBody extends StatelessWidget {
  RatingBody({Key? key}) : super(key: key);

  final List ratingFiltersList = [
    {
      "image": "assets/images/star_2.png",
      "rating": 1,
    },
    {
      "image": "assets/images/star_2.png",
      "rating": 2,
    },
    {
      "image": "assets/images/star_2.png",
      "rating": 3,
    },
    {
      "image": "assets/images/star_2.png",
      "rating": 4,
    },
    {
      "image": "assets/images/star_2.png",
      "rating": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Wrap(
        spacing: 4.0,
        runSpacing: 15.0,
        children: ratingFiltersList.map((type) {
          return RatingCard(
            imageFiltersStarRating: type["image"],
            ratingFilters: type["rating"],
          );
        }).toList(),
      ),
    );
  }
}

