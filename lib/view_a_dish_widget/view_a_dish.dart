import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/view_a_dish_widget/function/bju_body_function.dart';
import 'package:sushi_shop_project/view_a_dish_widget/function/ingredients_body_function.dart';
import 'package:sushi_shop_project/view_a_dish_widget/function/recommended_sides_body_function.dart';
import 'package:sushi_shop_project/view_a_dish_widget/function/toppings_body.dart';
import 'package:sushi_shop_project/view_a_dish_widget/tools/toppings_provider.dart';
import 'package:sushi_shop_project/view_a_dish_widget/util/add_a_request.dart';
import '../PROVIDER/order_provider.dart';
import 'util/view_bottom_bar.dart';

class ViewADish extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToppingsProvider(),
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    height: 200,
                    child: Center(
                      child: Image.asset(
                        imageDishView,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 260.0,
                            child: Text(
                              nameDishView,
                              style: const TextStyle(
                                fontSize: 21.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Mulish-Regular",
                                color: Color(0xFF32324D),
                              ),
                            ),
                          )
                        ],
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
                            priceView.toStringAsFixed(2),
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
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          descriptionView,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Mulish-Regular",
                            color: Color(0xFF8E8EA9),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  BJUBody(),
                  const SizedBox(height: 35),
                  const Row(
                    children: [
                      Text(
                        "Ingredients",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Mulish-Regular",
                          color: Color(0xFF666687),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  IngredientsBody(),
                  const SizedBox(height: 35),
                  const Row(
                    children: [
                      Text(
                        "Add toppings",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF666687),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ToppingsBody(),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text(
                        "Recommended sides",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF666687),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  RecommendedSidesBody(),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text(
                        "Add a request",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF666687),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const RequestInput(),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Consumer<ToppingsProvider>(
          builder: (context, toppingsProvider, _) {
            double totalPrice = toppingsProvider.getTotalPrice(priceView);
            return ViewBottomBar(
              imageDishView: imageDishView,
              nameDishView: nameDishView,
              priceView: totalPrice,
            );
          },
        ),
      ),
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
