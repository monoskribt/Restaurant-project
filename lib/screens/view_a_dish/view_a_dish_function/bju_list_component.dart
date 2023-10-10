import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_components/bju_card.dart';



class BJUListComponent extends StatelessWidget {
  BJUListComponent({Key? key}) : super(key: key);

  final List<Map<String, int>> bjuList = [
    {
      "kcal": 400,
      "grams": 510,
      "proteins": 30,
      "carbs": 56,
      "fats": 24,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: bjuList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = bjuList[index];
          return BJUCard(
            kcal: item["kcal"]!,
            grams: item["grams"]!,
            proteins: item["proteins"]!,
            carbs: item["carbs"]!,
            fats: item["fats"]!,
          );
        },
      ),
    );
  }
}

