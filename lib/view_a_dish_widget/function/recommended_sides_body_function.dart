import 'package:flutter/material.dart';
import 'package:sushi_shop_project/view_a_dish_widget/util/recommended_sides_card.dart';


class RecommendedSidesBody extends StatelessWidget {
  RecommendedSidesBody({Key? key,}) : super(key: key);

  final List recommendedSidesList = [
    {
      "image": "assets/images/pasta_1.png",
      "name": "Mac and Cheese",
      "price": 10.40,
    },
    {
      "image": "assets/images/recommended_sides_1.png",
      "name": "Curry Salmon",
      "price": 10.40,
    },
    {
      "image": "assets/images/recommended_sides_2.png",
      "name": "Yogurt and Fruits",
      "price": 10.40,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recommendedSidesList.length,
        itemBuilder: (context, index) {
          var recommended = recommendedSidesList[index];
          return RecommendedSidesCard(
            imageRecommended: recommended["image"],
            nameRecommended: recommended["name"],
            priceRecommended: recommended["price"],
          );
        },
      ),
    );
  }
}
