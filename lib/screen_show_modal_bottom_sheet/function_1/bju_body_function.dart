import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screen_show_modal_bottom_sheet/util_1/bju_card.dart';

class BJUBody extends StatelessWidget {
  BJUBody({super.key});

  final List<Map<String, dynamic>> bjucardList = [
    {
      "kcal": 400,
      "grams": 510,
      "proteins": 30,
      "carbs": 56,
      "fats": 24,
    },
    // Add more items to the list if needed
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: bjucardList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = bjucardList[index];
          return BJUCard(
            kcal: item["kcal"],
            grams: item["grams"],
            proteins: item["proteins"],
            carbs: item["carbs"],
            fats: item["fats"],
          );
        },
      ),
    );
  }
}

