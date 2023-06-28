import 'package:flutter/material.dart';
import 'package:sushi_shop_project/util/pasta_card.dart';

class PastaCardBody extends StatelessWidget {
  PastaCardBody({Key? key}) : super(key: key);

  final List PastaCardList = [
    ["Pasta 1", 12.50, 4.0, "assets/images/pasta_1.png"],
    ["Pasta 2", 17.90, 5.0, "assets/images/pasta_1.png"],
    ["Pasta 3", 14.20, 4.2, "assets/images/pasta_1.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: PastaCardList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PastaCard(
            nameDish: PastaCardList[index][0],
            price: PastaCardList[index][1],
            rating: PastaCardList[index][2],
            imageMostPopular: PastaCardList[index][3],
          );
        },
      ),
    );
  }
}
