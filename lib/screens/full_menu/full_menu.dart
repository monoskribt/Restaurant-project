import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Foodbox/data_parsing/parsing/parsing_for_search_dish/dish_data_for_search_parse.dart';
import 'package:Foodbox/data_parsing/parsing/parsing_restaurant_name/restaurant_name_parse.dart';
import 'package:Foodbox/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:Foodbox/features/cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';
import 'package:Foodbox/screens/full_menu/full_menu_components/category_text.dart';
import 'package:Foodbox/screens/full_menu/full_menu_components/search_widget.dart';
import 'package:Foodbox/screens/full_menu/full_menu_components/sorting_category_list.dart';
import 'package:Foodbox/screens/full_menu/full_menu_function/daily_specials_menu.dart';
import 'package:Foodbox/screens/full_menu/full_menu_function/most_popular_menu.dart';
import 'package:Foodbox/screens/full_menu/full_menu_function/pasta_menu.dart';
import 'package:Foodbox/screens/full_menu/full_menu_function/salad_menu.dart';
import '../drawer_widget/main_drawer.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
  final GlobalKey<ScaffoldState> fullManuScaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCategory = "All Dishes";
  String selectedRestaurant = "Foodbox";

  Future<List<String>> fetchRestaurantList() async {
    RestaurantNameParse restaurantNameParse = RestaurantNameParse();
    List<String> restaurantList =
        await restaurantNameParse.loadRestaurantsNames();
    return restaurantList;
  }

  @override
  void initState() {
    super.initState();
    DishDataForSearchParse.loadMenuFromXml(selectedRestaurant);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: fullManuScaffoldKey,
        endDrawer: const MainDrawer(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: double.infinity,
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
                padding:  EdgeInsets.only(
                    top: 0.03 * screenHeight,
                    left: 0.06 * screenWidth,
                    right: 0.06 * screenWidth,
                    bottom: 0
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTopBar(context),
                      SizedBox(height: 0.022 * screenHeight),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Choose the best dish for you",
                          style: TextStyle(
                            fontSize: 0.028 * screenHeight,
                            fontWeight: FontWeight.w600,
                            fontFamily: "DMSans-Regular",
                            color: const Color(0xFF32324D),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.02 * screenHeight),
                      const SearchWidget(),
                      SizedBox(height: 0.0265 * screenHeight),
                      const DailySpecials(),
                      SizedBox(height: 0.0265 * screenHeight),
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 0.02 * screenWidth),
          child: SvgPicture.asset(
            "assets/images/navigator.svg",
            height: 0.0265 * screenHeight,
            width: 0.0265 * screenWidth,
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
                  style: TextStyle(
                    fontSize: 0.024 * screenHeight,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF8E8EA9),
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
            height: 0.032 * screenHeight,
            width: 0.032 * screenWidth,
          ),
          onPressed: () {
            fullManuScaffoldKey.currentState?.openEndDrawer();

          },
        )
      ],
    );
  }

  Widget buildSortingContent(SortingDishesState state) {
    final screenHeight = MediaQuery.of(context).size.height;
    switch (state) {
      case SortingDishesState.allDishes:
        return Column(
          children: [
            SizedBox(height: 0.024 * screenHeight),
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
            SizedBox(height: 0.024 * screenHeight),
            const CategoryText(text: "Most Popular"),
            MostPopularMenu(),
          ],
        );
      case SortingDishesState.salad:
        return Column(
          children: [
            SizedBox(height: 0.024 * screenHeight),
            const CategoryText(text: "Salad"),
            const SaladMenu(),
          ],
        );
      case SortingDishesState.pasta:
        return Column(
          children: [
            SizedBox(height: 0.024 * screenHeight),
            const CategoryText(text: "Pasta"),
            PastaMenu(),
          ],
        );
      default:
        return Container();
    }
  }

  void showRestaurant(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
                title: Text("Select a restaurant",
                    textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 0.026 * screenHeight,
                    fontWeight: FontWeight.w600,
                    fontFamily: "DMSans-Regular",
                    color: const Color(0xFF32324D),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: restaurantNames!.map((restaurantName) {
                    return ListTile(
                      title: Text(
                        restaurantName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 0.023 * screenHeight,
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
