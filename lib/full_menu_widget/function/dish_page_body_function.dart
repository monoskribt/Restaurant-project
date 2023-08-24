import 'package:flutter/cupertino.dart';

import '../util/product_day_card.dart';

class DishPageBody extends StatefulWidget {
  DishPageBody({Key? key}) : super(key: key);

  @override
  State<DishPageBody> createState() => _DishPageBodyState();
}

class _DishPageBodyState extends State<DishPageBody> {
  final List productCard = [
    {
      "name": "Борщ пісний з копченою грушею",
      "price": 55.00,
      "image": "assets/images/dish_of_day_1.png",
      "description": "Подається зі сметаною.",
    },
    {
      "name": "Фірмова свинина 'Корчма'",
      "price": 166.00,
      "image": "assets/images/dish_of_day_1.png",
      "description": "Запечена до рум'яної скоринки з цибулею, під вершковим соусом та сиром.",
    },
    {
      "name": "Язик у вершковому соусі",
      "price": 153.00,
      "image": "assets/images/dish_of_day_1.png",
      "description": "Шматочки яловичого язика, обсмажені на вершковому маслі та доведені до смаку у соусі з вершків, глив та шпинату.",
    },
  ];

  PageController pageController = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      width: 380,
      child: PageView.builder(
        controller: pageController,
        itemCount: productCard.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var dish = productCard[index];
          return ProductDayCard(
            nameDishOfDay: dish["name"],
            priceDishOfDay: dish["price"],
            imageDishOfDay: dish["image"],
            descriptionDishOfDay: dish["description"],
          );
        },
      ),
    );
  }
}
