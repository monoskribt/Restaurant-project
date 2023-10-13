import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/full_menu/helpers/view_a_dish_helper.dart';

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
        padding: const EdgeInsets.only(top: 16, right: 20, bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 142,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 110,
                  width: 110,
                  child: Center(
                    child: Image.asset(
                      imageMostPopular,
                      width: 110,
                      height: 110,
                    ),
                  ),
                ),
                Text(
                  nameDish,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Mulish-Regular",
                    color: Color(0xFF32324D),
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        "\$",
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Mulish-Regular",
                          color: Color(0xFFFFB080),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      price.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFFFF7B2C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}