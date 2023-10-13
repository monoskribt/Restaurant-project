import 'package:flutter/material.dart';
import 'package:sushi_shop_project/data/parsing_dish_card/menu_parse.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/salad_card.dart';

class SaladMenu extends StatelessWidget {
  const SaladMenu({Key? key}) : super(key: key);
  Future<List<Map<String, dynamic>>> fetchSaladMenu() async {
    MenuParse menuParser = MenuParse(categories: []);
    MenuParse menu = await menuParser.parseXmlFile();

    return menu.categories
        .firstWhere((category) => category.id == "2")
        .dishes
        .map((dish) => {
              "name": dish.title,
              "price": dish.price,
              "image": dish.image,
              "description": dish.description,
            })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchSaladMenu(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        else {
          return SizedBox(
            height: 230,
            child: ListView.builder(
              itemCount: snapshot.data?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var dish = snapshot.data?[index];
                return SaladCard(
                  nameDish: dish?["name"],
                  price: dish?["price"],
                  imageSaladCard: dish?["image"],
                  description: dish?["description"],
                );
              },
            ),
          );
        }
      },
    );
  }
}
