import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sushi_shop_project/data/parsing_dish_card/menu_parse.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/daily_specials_card.dart';

class DailySpecials extends StatelessWidget {
  DailySpecials({Key? key}) : super(key: key);
  Future<List<Map<String, dynamic>>> fetchDailySpecials() async {
    MenuParse menuParser = MenuParse(categories: []);
    MenuParse menu = await menuParser.parseXmlFile();

    return menu.categories
        .firstWhere((category) => category.id == '4')
        .dishes
        .map((dish) => {
      "name": dish.title,
      "price": dish.price,
      "image": dish.image,
      "description": dish.description
    })
        .toList();
  }

  PageController pageController = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchDailySpecials(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        else if(snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        else {
          return SizedBox(
            height: 145,
            width: 380,
            child: PageView.builder(
              controller: pageController,
              itemCount: snapshot.data?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var dish = snapshot.data?[index];
                return DailySpecialsCard(
                    nameDishOfDay: dish?["name"],
                    priceDishOfDay: dish?["price"],
                    imageDishOfDay: dish?["image"],
                    descriptionDishOfDay: dish?["description"]
                );
              },
            ),
          );
        }
      },
    );
  }
}
