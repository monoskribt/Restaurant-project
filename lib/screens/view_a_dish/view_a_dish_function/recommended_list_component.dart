import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_shop_project/data_parsing/parsing/parsing_dish_card/menu_parse.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
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
    final restaurantCubit = context.read<RestaurantCubit>();
    final selectedRestaurant = restaurantCubit.state;

    _fetchRecommendedListFuture = fetchRecommendedListComponent(context, selectedRestaurant);
  }

  Future<List<Map<String, dynamic>>> fetchRecommendedListComponent(BuildContext context, String selectedRestaurant) async {
    final restaurantCubit = context.read<RestaurantCubit>();
    final menuData = await restaurantCubit.loadMenuForSelectedRestaurant();

    if (menuData != null) {
      List<Map<String, dynamic>> mostPopularList = [];
      for (var categoryData in menuData) {
        if (categoryData["id"] == "5") {
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
