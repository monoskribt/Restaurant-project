import 'package:flutter/material.dart';

class ProductDayCard extends StatelessWidget {
  final String nameDish;
  final String typeOfDishes;
  final String imageDishOfDay;
  final double price;

  const ProductDayCard({
    Key? key,
    required this.nameDish,
    required this.typeOfDishes,
    required this.price,
    required this.imageDishOfDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: const Color(0xFF212134),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Product of the day",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFA5A5BA),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    nameDish,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    typeOfDishes,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF7B2C),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          price.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFFF7B2C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 141,
                  height: 145,
                  child: Image.asset(
                    imageDishOfDay,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
