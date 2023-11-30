import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Foodbox/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:Foodbox/screens/full_menu/full_menu_components/most_popular_card.dart';


class MostPopularMenu extends StatelessWidget {
  MostPopularMenu({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> fetchMostPopularDishes(BuildContext context, String selectedRestaurant) async {
    final restaurantCubit = context.read<RestaurantCubit>();
    final menuData = await restaurantCubit.loadMenuForSelectedRestaurant();

    if (menuData != null) {
      List<Map<String, dynamic>> mostPopularList = [];
      for (var categoryData in menuData) {
        if (categoryData["id"] == "1") {
          mostPopularList = List<Map<String, dynamic>>.from(categoryData["dishes"]);
          break;
        }
      }

      return mostPopularList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, String>(
      builder: (context, selectedRestaurant) {
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchMostPopularDishes(context, selectedRestaurant),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SizedBox(
                height: 0.3 * MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var dish = snapshot.data?[index];
                    return MostPopularCard(
                      nameDish: dish?["name"],
                      price: dish?["price"],
                      imageMostPopular: dish?["image"],
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
