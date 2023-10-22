import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/toppings_provider.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_components/add_a_request.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_components/view_bottom_bar.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_function/bju_list_component.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_function/ingredients_list_component.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_function/recommended_list_component.dart';
import 'package:sushi_shop_project/screens/view_a_dish/view_a_dish_function/toppings_list_component.dart';

class ViewADish extends StatefulWidget {
  final String imageDishView;
  final String nameDishView;
  final double priceView;
  final String descriptionView;

  const ViewADish({
    Key? key,
    required this.imageDishView,
    required this.nameDishView,
    required this.priceView,
    required this.descriptionView,
  }) : super(key: key);

  @override
  State<ViewADish> createState() => _ViewADishState();
}

class _ViewADishState extends State<ViewADish> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ToppingsProvider(),
      child: Scaffold(
        body: buildBody(),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildColumnContent(),
        ),
      ),
    );
  }

  Column buildColumnContent() {
    return Column(
      children: [
        buildImage(),
        const SizedBox(height: 30.0),
        buildDishDetails(),
        const SizedBox(height: 15),
        buildDescription(),
        const SizedBox(height: 35),
        BJUListComponent(),
        const SizedBox(height: 35),
        buildSectionTitle("Ingredients"),
        const SizedBox(height: 15),
        IngredientsListComponent(),
        const SizedBox(height: 35),
        buildSectionTitle("Add toppings"),
        const SizedBox(height: 15),
        const ToppingsListComponent(),
        const SizedBox(height: 30),
        buildSectionTitle("Recommended sides"),
        const SizedBox(height: 15),
        const RecommendedListComponent(),
        const SizedBox(height: 30),
        buildSectionTitle("Add a request"),
        const SizedBox(height: 15),
        RequestInput(nameDishView: widget.nameDishView, priceView: widget.priceView),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget buildImage() {
    return SizedBox(
      width: 400,
      height: 200,
      child: Center(
        child: Image.asset(
          widget.imageDishView,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildDishDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(
          width: 260.0,
          child: Text(
            widget.nameDishView,
            style: const TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.w700,
              fontFamily: "Mulish-Regular",
              color: Color(0xFF32324D),
            ),
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 7.0, right: 3.0),
              child: Text(
                "\$",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFB080),
                ),
              ),
            ),
            Text(
              widget.priceView.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 24,
                fontFamily: "Mulish-Regular",
                fontWeight: FontWeight.w800,
                color: Color(0xFFFF7B2C),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDescription() {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.descriptionView,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "Mulish-Regular",
              color: Color(0xFF8E8EA9),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Mulish-Regular",
            color: Color(0xFF666687),
          ),
        ),
      ],
    );
  }

  Widget buildBottomNavigationBar() {
    return Consumer<ToppingsProvider>(
      builder: (context, toppingsProvider, _) {
        double totalPrice = toppingsProvider.getTotalPrice(widget.priceView);
        return ViewBottomBar(
          imageDishView: widget.imageDishView,
          nameDishView: widget.nameDishView,
          priceView: totalPrice,
        );
      },
    );
  }

  void showViewADish(BuildContext context, String image, String name, double price, String description) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ViewADish(
          imageDishView: image,
          nameDishView: name,
          priceView: price,
          descriptionView: description,
        );
      },
    );
  }
}
