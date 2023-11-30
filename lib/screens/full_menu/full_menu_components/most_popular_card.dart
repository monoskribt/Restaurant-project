import 'package:flutter/material.dart';
import 'package:Foodbox/screens/full_menu/helpers/view_a_dish_helper.dart';

class MostPopularCard extends StatelessWidget {
  final String nameDish;
  final double price;
  final String imageMostPopular;
  final String description;

  const MostPopularCard({
    Key? key,
    required this.nameDish,
    required this.price,
    required this.imageMostPopular,
    required this.description,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        ViewADishHelper.showViewADish(
            context,
            imageMostPopular,
            nameDish,
            price,
            description
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
            top: 0.02 * screenHeight,
            right: 0.03 * screenHeight,
            bottom: 0.02 * screenHeight
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 0.35 * screenWidth,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Image.asset(
                    imageMostPopular,
                    height: 0.25 * screenHeight / 2,
                    width: 0.25 * screenWidth,
                  ),
                ),
                Text(
                  nameDish,
                  style: TextStyle(
                    fontSize: 0.018 * screenHeight,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Mulish-Regular",
                    color: const Color(0xFF32324D),
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                SizedBox(height: 0.001 * screenHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Padding(
                      padding: EdgeInsets.only(
                          bottom: 0.008 * screenHeight
                      ),
                      child: Text(
                        "\$",
                        style: TextStyle(
                          fontSize: 0.012 * screenHeight,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Mulish-Regular",
                          color: const Color(0xFFFFB080),
                        ),
                      ),
                    ),
                    SizedBox(width: 0.005 * screenWidth),
                    Text(
                      price.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 0.018 * screenHeight,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Mulish-Regular",
                        color: const Color(0xFFFF7B2C),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.008 * screenHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
