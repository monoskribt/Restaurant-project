import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/toppings_provider.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish_components/add_a_request.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish_components/view_bottom_bar.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish_function/bju_list_component.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish_function/ingredients_list_component.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish_function/recommended_list_component.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish_function/toppings_list_component.dart';
import 'package:provider/provider.dart';

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
        body: GestureDetector(onTap: () {
          FocusScope.of(context).unfocus();
        }, child: buildBody()),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBody() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
        padding: EdgeInsets.only(
          top: 0.025 * screenHeight,
          left: 0.055 * screenWidth,
          right: 0.055 * screenWidth,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildColumnContent(),
        ),
      ),
    );
  }

  Column buildColumnContent() {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        buildImage(),
        SizedBox(height: 0.04 * screenHeight),
        buildDishDetails(),
        SizedBox(height: 0.02 * screenHeight),
        buildDescription(),
        SizedBox(height: 0.045 * screenHeight),
        const BJUListComponent(),
        SizedBox(height: 0.045 * screenHeight),
        buildSectionTitle("Ingredients"),
        SizedBox(height: 0.02 * screenHeight),
        const IngredientsListComponent(),
        SizedBox(height: 0.045 * screenHeight),
        buildSectionTitle("Add toppings"),
        SizedBox(height: 0.02 * screenHeight),
        const ToppingsListComponent(),
        SizedBox(height: 0.04 * screenHeight),
        buildSectionTitle("Recommended sides"),
        SizedBox(height: 0.02 * screenHeight),
        const RecommendedListComponent(),
        SizedBox(height: 0.04 * screenHeight),
        buildSectionTitle("Add a request"),
        SizedBox(height: 0.02 * screenHeight),
        RequestInput(nameDishView: widget.nameDishView, priceView: widget.priceView),
        SizedBox(height: 0.035 * screenHeight),
      ],
    );
  }

  Widget buildImage() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Image.asset(
        widget.imageDishView,
        width: 0.5 * screenWidth,
        height: 0.3 * screenHeight,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildDishDetails() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: 1 * screenWidth,
            child: Text(
              widget.nameDishView,
              style: TextStyle(
                fontSize: 0.03 * screenHeight,
                fontWeight: FontWeight.w700,
                fontFamily: "Mulish-Regular",
                color: const Color(0xFF32324D),
              ),
            ),
          ),
          SizedBox(width: 0.07 * screenWidth),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0.01 * screenHeight,
                    right: 0.004 * screenHeight
                ),
                child: Text(
                  "\$",
                  style: TextStyle(
                    fontSize: 0.016 *screenHeight,
                    fontFamily: "Mulish-Regular",
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFFFB080),
                  ),
                ),
              ),
              Text(
                widget.priceView.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 0.031 * screenHeight,
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFFFF7B2C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDescription() {
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.descriptionView,
            style: TextStyle(
              fontSize: 0.018 * screenHeight,
              fontWeight: FontWeight.w500,
              fontFamily: "Mulish-Regular",
              color: const Color(0xFF8E8EA9),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 0.021 * screenHeight,
            fontWeight: FontWeight.w600,
            fontFamily: "Mulish-Regular",
            color: const Color(0xFF666687),
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
