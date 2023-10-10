import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/salad_card.dart';

class SaladMenu extends StatelessWidget {
  SaladMenu({Key? key}) : super(key: key);

  final List saladCardList = [
    {
      "name": "Салат улюблений з дитинства Олів'є",
      "price": 59.00,
      "image": "assets/images/salad_1.png",
      "description": "З куркою або з ковбасою. Заправляється домашнім майонезом.",
    },
    {
      "name": "Салат із запеченим гарбузом",
      "price": 72.00,
      "image": "assets/images/salad_1.png",
      "description": "Руккола,коріандр, помідори чері з запеченим гарбузом, заправляється ягідним соусом.",
    },
    {
      "name": "Салат Оселедець під шубою",
      "price": 13.30,
      "image": "assets/images/salad_1.png",
      "description": "Традиційний салат з оселедця, з запеченими овочами та майонезом.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: saladCardList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var dish = saladCardList[index];
            return SaladCard(
              nameDish: dish["name"],
              price: dish["price"],
              imageSaladCard: dish["image"],
              description: dish["description"],
            );
          },
        )
    );
  }
}
