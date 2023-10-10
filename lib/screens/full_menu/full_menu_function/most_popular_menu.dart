import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/most_popular_card.dart';

class MostPopularMenu extends StatelessWidget {
  MostPopularMenu({Key? key}) : super(key: key);

  final List mostPopular = [
    {
      "name": "Суп-локшина на наваристому курячому бульоні",
      "price": 61.00,
      "image": "assets/images/most_popular_1.png",
      "description": "Подається з куркою, домашньою локшиною, та сухариками.",
    },
    {
      "name": "Ніжка кролика тушкована у вершковому соусі",
      "price": 254.00,
      "image": "assets/images/most_popular_2.png",
      "description": "Подається з диким рисом.",
    },
    {
      "name": "Фірмове сало від 'Корчми' - сало домашнє",
      "price": 49.00,
      "image": "assets/images/most_popular_2.png",
      "description":
          "'Фірмове сало від 'Корчми' - це ніжне домашнє сало, яке стало візитною карткою ресторану 'Корчма'. Воно приготовлено з найкращих шматочків свинини, вручну підготовлених та нарізаних експертами свого ремесла. Це сало відображає найкращі традиції гастрономічної майстерності і дух гостинності, який завжди присутній у ресторані 'Корчма'. Додайте аутентичний смак до свого столу з цим вишуканим домашнім салом, який надає вам можливість насолоджуватися смачними моментами в стилі 'Корчма' у затишному домашньому оточенні.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        itemCount: mostPopular.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var dish = mostPopular[index];
          return MostPopularCard(
            nameDish: dish["name"],
            price: dish["price"],
            imageMostPopular: dish["image"],
            description: dish["description"],
          );
        },
      ),
    );
  }
}
