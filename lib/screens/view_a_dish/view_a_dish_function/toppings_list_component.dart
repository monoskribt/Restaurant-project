import 'package:flutter/material.dart';
import 'package:Foodbox/data_parsing/models/toppings_model.dart';
import 'package:Foodbox/data_parsing/parsing/parsing_for_toppings/toppings_parse.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish_components/toppings_card.dart';


class ToppingsListComponent extends StatelessWidget {
  const ToppingsListComponent({Key? key}) : super(key: key);

  Future<List<ToppingsModel>> fetchToppingsList() async {
    ToppingsParse toppingsParser = ToppingsParse();
    List<ToppingsModel> toppingsList = await toppingsParser.parseXmlFile();
    return toppingsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ToppingsModel>>(
      future: fetchToppingsList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No toppings available.'));
        }
        else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              var toppings = snapshot.data?[index];
              return ToppingsCard(
                nameToppings: toppings!.title,
                priceToppings: toppings!.price,
              );
            },
          );
        }
      },
    );
  }
}
