import 'package:flutter/material.dart';
import 'package:Foodbox/data_parsing/models/ingredients_model.dart';
import 'package:Foodbox/data_parsing/parsing/parsing_for_ingredients/ingredients_parse.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish_components/ingredients_card.dart';


class IngredientsListComponent extends StatelessWidget {
  const IngredientsListComponent({Key? key}) : super(key: key);

  Future<List<IngredientsModel>> fetchIngredientsList() async {
    IngredientsParse ingredientsParser = IngredientsParse();
    List<IngredientsModel> ingredientsList = await ingredientsParser.parseXmlFile();
    return ingredientsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IngredientsModel>>(
        future: fetchIngredientsList(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          else if(snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No toppings available.'));
          }
          else{
            return SizedBox(
              height: 75,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var ingredient = snapshot.data?[index];
                  return IngredientsCard(
                    title: ingredient!.title,
                    imageIngredients: ingredient.image
                  );
                },
              ),
            );
          }
        }
    );
  }
}
