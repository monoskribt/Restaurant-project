import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/search_widget.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_function/daily_specials_menu.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_function/most_popular_menu.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_function/pasta_menu.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_function/salad_menu.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/sorting_category_list.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu_components/category_text.dart';
import '../drawer_widget/main_drawer.dart';

void main() => runApp(const FullMenu());

class FullMenu extends StatefulWidget {
  const FullMenu({Key? key}) : super(key: key);

  @override
  State<FullMenu> createState() => _FullMenuState();
}

class _FullMenuState extends State<FullMenu> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCategory = "All Dishes";

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
        const Text(
          "Gram Bistro",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8E8EA9),
            fontFamily: "Mulish-Regular",
          ),
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
            SaladMenu(),
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
        return Column(
          children: [
            const SizedBox(height: 15),
            const CategoryText(text: "Salad"),
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
}
