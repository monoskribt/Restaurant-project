import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Foodbox/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:Foodbox/screens/full_menu/full_menu_components/daily_specials_card.dart';


class DailySpecials extends StatelessWidget {
  const DailySpecials({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> fetchDailySpecials(BuildContext context, String selectedRestaurant) async {
    final restaurantCubit = context.read<RestaurantCubit>();
    final menuData = await restaurantCubit.loadMenuForSelectedRestaurant();

    if (menuData != null) {
      List<Map<String, dynamic>> dailySpecials = [];
      for (var categoryData in menuData) {
        if (categoryData["id"] == "4") {
          dailySpecials = List<Map<String, dynamic>>.from(categoryData["dishes"]);
          break;
        }
      }

      return dailySpecials;
    } else {
      return [];
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, String>(
      builder: (context, selectedRestaurant) {
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchDailySpecials(context, selectedRestaurant),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return SizedBox(
                height: 0.19 * MediaQuery.of(context).size.height,
                width: 0.95 * MediaQuery.of(context).size.width,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var dish = snapshot.data?[index];
                    return DailySpecialsCard(
                      nameDishOfDay: dish?["name"],
                      priceDishOfDay: dish?["price"],
                      imageDishOfDay: dish?["image"],
                      descriptionDishOfDay: dish?["description"],
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


