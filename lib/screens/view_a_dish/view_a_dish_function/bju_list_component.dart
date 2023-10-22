import 'package:flutter/material.dart';
import 'package:sushi_shop_project/data_parsing/models/bju_model.dart';
import 'package:sushi_shop_project/data_parsing/parsing/parsing_for_bju/bju_parse.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_components/bju_card.dart';

class BJUListComponent extends StatelessWidget {
  const BJUListComponent({Key? key}) : super(key: key);

  Future<List<BjuModel>> fetchBjuList() async {
    BjuParse bjuParser = BjuParse();
    List<BjuModel> bjuList = await bjuParser.parseXmlFile();
    return bjuList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BjuModel>>(
      future: fetchBjuList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No BJU available.'));
        } else {
          int? kcal = snapshot.data!.firstWhere((bju) => bju.title == 'kcal').value;
          int? grams = snapshot.data!.firstWhere((bju) => bju.title == 'grams').value;
          int? proteins = snapshot.data!.firstWhere((bju) => bju.title == 'proteins').value;
          int? carbs = snapshot.data!.firstWhere((bju) => bju.title == 'carbs').value;
          int? fats = snapshot.data!.firstWhere((bju) => bju.title == 'fats').value;

          return SizedBox(
            height: 60,
            child: BJUCard(
              kcal: kcal!,
              grams: grams!,
              proteins: proteins!,
              carbs: carbs!,
              fats: fats!,
            ),
          );
        }
      },
    );
  }
}
