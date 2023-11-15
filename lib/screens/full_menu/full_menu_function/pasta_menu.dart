import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_shop_project/data_parsing/parsing/parsing_dish_card/menu_parse.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/pasta_card.dart';

class PastaMenu extends StatelessWidget {
  PastaMenu({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> fetchPastaMenu(BuildContext context, String selectedRestaurant) async {
    final restaurantCubit = context.read<RestaurantCubit>();
    final menuData = await restaurantCubit.loadMenuForSelectedRestaurant();

    if (menuData != null) {
      List<Map<String, dynamic>> pastaList = [];
      for (var categoryData in menuData) {
        if (categoryData["id"] == "3") {
          pastaList = List<Map<String, dynamic>>.from(categoryData["dishes"]);
          break;
        }
      }

      return pastaList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, String>(
      builder: (context, selectedRestaurant) {
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchPastaMenu(context, selectedRestaurant),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            else if(snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            else {
              return SizedBox(
                height: 0.3 * MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var dish = snapshot.data?[index];
                    return PastaCard(
                      nameDish: dish?["name"],
                      price: dish?["price"],
                      imagePastaCard: dish?["image"],
                      description: dish?["description"],
                    );
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
