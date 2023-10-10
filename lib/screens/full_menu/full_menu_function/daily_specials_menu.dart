import 'package:flutter/cupertino.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/daily_specials_card.dart';

class DailySpecials extends StatefulWidget {
  const DailySpecials({Key? key}) : super(key: key);

  @override
  State<DailySpecials> createState() => _DailySpecialsState();
}

class _DailySpecialsState extends State<DailySpecials> {
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
          return DailySpecialsCard(
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
