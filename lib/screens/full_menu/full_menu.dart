import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sushi_shop_project/data_parsing/parsing/parsing_for_search_dish/dish_data_for_search_parse.dart';
import 'package:sushi_shop_project/data_parsing/parsing/parsing_restaurant_name/restaurant_name_parse.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/search_widget.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_function/daily_specials_menu.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_function/most_popular_menu.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_function/pasta_menu.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_function/salad_menu.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/sorting_category_list.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/category_text.dart';
import '../drawer_widget/main_drawer.dart';

void main() async {
  BlocProvider(
    create: (context) => RestaurantCubit(),
    child: const FullMenu(),
  );
}

class FullMenu extends StatefulWidget {
  const FullMenu({Key? key}) : super(key: key);

  @override
  State<FullMenu> createState() => _FullMenuState();
}

class _FullMenuState extends State<FullMenu> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCategory = "All Dishes";
  String selectedRestaurant = "Gram Bistro";

  Future<List<String>> fetchRestaurantList() async {
    RestaurantNameParse restaurantNameParse = RestaurantNameParse();
    List<String> restaurantList =
        await restaurantNameParse.loadRestaurantsNames();
    return restaurantList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        endDrawer: const MainDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFFCFCFC),
                Color(0xFFF7F7F7),
                Color(0xFFF7F7F7),
                Color(0xFFF7F7F7),
                Color(0xFFFCFCFC),
              ],
              stops: [0, 0.1004, 0.5156, 0.8958, 1],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 25, right: 25, bottom: 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTopBar(context),
                    const SizedBox(height: 17),
                    const Text(
                      "Choose the best dish for you",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: "DMSans-Regular",
                        color: Color(0xFF32324D),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SearchWidget(),
                    const SizedBox(height: 20),
                    const DailySpecials(),
                    const SizedBox(height: 20),
                    const SortingCategoryList(),
                    BlocBuilder<SortingDishesCubit, SortingDishesState>(
                        builder: (context, state) {
                      return buildSortingContent(state);
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTopBar(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(
            "assets/images/navigator.svg",
            height: 20,
            width: 20,
            color: const Color(0xFFDCDCE4),
          ),
        ),
        GestureDetector(
          onTap: () {
            showRestaurant(context);
          },
            child: BlocBuilder<RestaurantCubit, String>(
              builder: (context, state) {
                return Text(
                  state,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8E8EA9),
                    fontFamily: "Mulish-Regular",
                  ),
                );
              },
            )
        ),
        const Spacer(),
        IconButton(
          icon: SvgPicture.asset(
            "assets/images/menu.svg",
            height: 24,
            width: 24,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        )
      ],
    );
  }

  Widget buildSortingContent(SortingDishesState state) {
    switch (state) {
      case SortingDishesState.allDishes:
        return Column(
          children: [
            const SizedBox(height: 15),
            const CategoryText(text: "Most Popular"),
            MostPopularMenu(),
            const CategoryText(text: "Salad"),
            const SaladMenu(),
            const CategoryText(text: "Pasta"),
            PastaMenu(),
          ],
        );
      case SortingDishesState.mostPopular:
        return Column(
          children: [
            const SizedBox(height: 15),
            const CategoryText(text: "Most Popular"),
            MostPopularMenu(),
          ],
        );
      case SortingDishesState.salad:
        return const Column(
          children: [
            SizedBox(height: 15),
            CategoryText(text: "Salad"),
            SaladMenu(),
          ],
        );
      case SortingDishesState.pasta:
        return Column(
          children: [
            const SizedBox(height: 15),
            const CategoryText(text: "Pasta"),
            PastaMenu(),
          ],
        );
      default:
        return Container();
    }
  }

  void showRestaurant(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<List<String>>(
          future: fetchRestaurantList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text("Error"),
                content: const Text("Failed to load list of restaurants."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Close"),
                  ),
                ],
              );
            } else {
              final restaurantNames = snapshot.data;
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text("Select a restaurant",
                    textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "DMSans-Regular",
                    color: Color(0xFF32324D),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: restaurantNames!.map((restaurantName) {
                    return ListTile(
                      title: Text(
                        restaurantName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: "Mulish-Regular",
                        ),
                      ),
                      onTap: () {
                        final restaurantCubit = context.read<RestaurantCubit>();
                        restaurantCubit.selectRestaurant(restaurantName);
                        setState(() {
                          selectedRestaurant = restaurantName;
                        });
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
