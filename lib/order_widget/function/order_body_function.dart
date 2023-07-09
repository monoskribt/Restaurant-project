import 'package:flutter/material.dart';
import 'package:sushi_shop_project/order_widget/tools/dismiss.dart';
import 'package:sushi_shop_project/order_widget/util/order_menu_card.dart';

class OrderBody extends StatelessWidget {
  OrderBody({Key? key}) : super(key: key);

  final List orderCardList = [
    {
      "image": "assets/images/pasta_1.png",
      "name": "Avocado and Egg Toast",
      "rating": 4.9,
      "review": 120,
      "price": 10.40,
    },
    {
      "image": "assets/images/recommended_sides_1.png",
      "name": "Curry Salmon",
      "rating": 4.9,
      "review": 120,
      "price": 10.40,
    },
    {
      "image": "assets/images/recommended_sides_2.png",
      "name": "Yogurt and Fruits",
      "rating": 4.9,
      "review": 120,
      "price": 10.40,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: orderCardList.length,
        itemBuilder: (context, index) {
          var order = orderCardList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 0),
            child: SizedBox(
              height: 120,
              width: 360,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Dismissible(
                  key: Key(order["name"]),
                  direction: DismissDirection.endToStart,
                  secondaryBackground: const DismissBackground(
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  background: const DismissBackground(
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  onDismissed: (direction) {
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Color(0xFFFFB01D), Colors.transparent],
                      ),
                    ),
                    child: OrderCard(
                      imageOrder: order["image"],
                      nameOrder: order["name"],
                      ratingOrder: order["rating"],
                      reviewOrder: order["review"],
                      priceOrder: order["price"],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
