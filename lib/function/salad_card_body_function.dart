import 'package:flutter/material.dart';

import '../util/salad_card.dart';

class SaladCardBody extends StatelessWidget {
  SaladCardBody({Key? key}) : super(key: key);

  final List saladCardList = [
    ["Salad 1", 11.10, 4.1, "assets/images/salad_1.png"],
    ["Salad 2", 12.20, 5.0, "assets/images/salad_1.png"],
    ["Salad 3", 13.30, 4.7, "assets/images/salad_1.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: saladCardList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SaladCard(
              nameDish: saladCardList[index][0],
              price: saladCardList[index][1],
              rating: saladCardList[index][2],
              imageMostPopular: saladCardList[index][3],
            );
          },
        )
    );
  }
}
