import 'package:flutter/material.dart';
import 'package:sushi_shop_project/data/parsing_dish_card/menu_parse.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_components/recommended_sides_card.dart';

class RecommendedListComponent extends StatefulWidget {
  const RecommendedListComponent({Key? key,}) : super(key: key);

  @override
  State<RecommendedListComponent> createState() => _RecommendedListComponentState();
}

class _RecommendedListComponentState extends State<RecommendedListComponent> {
  late Future<List<Map<String, dynamic>>> _fetchRecommendedListFuture;

  @override
  void initState() {
    super.initState();
    _fetchRecommendedListFuture = fetchRecommendedListComponent();
  }

  Future<List<Map<String, dynamic>>> fetchRecommendedListComponent() async {
    MenuParse menuParser = MenuParse(categories: []);
    MenuParse menu = await menuParser.parseXmlFile();

    return menu.categories
        .firstWhere((category) => category.id == '5')
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
      future: _fetchRecommendedListFuture,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        else if(snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        else {
          return SizedBox(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                var recommended = snapshot.data?[index];
                return RecommendedSidesCard(
                  imageRecommended: recommended?["image"],
                  nameRecommended: recommended?["name"],
                  priceRecommended: recommended?["price"],
                );
              },
            ),
          );
        }
      },
    );
  }
}
