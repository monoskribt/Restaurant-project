import 'package:flutter/material.dart';

import '../tools/cart_counter.dart';

class RecommendedSidesCard extends StatelessWidget {
  final String imageRecommended;
  final String nameRecommended;
  final double ratingRecommended;
  final dynamic reviewRecommended;
  final double priceRecommended;

  const RecommendedSidesCard({
    Key? key,
    required this.imageRecommended,
    required this.nameRecommended,
    required this.ratingRecommended,
    this.reviewRecommended,
    required this.priceRecommended,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 120,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: 120,
                height: 140,
                child: Image.asset(
                  imageRecommended,
                  width: 140,
                  height: 140,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 1.0, bottom: 10.0, top: 10.0),
                          child: Row(
                            children: [
                              Text(
                                nameRecommended,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Mulish-Regular",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF32324D),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: SizedBox(
                                width: 15,
                                height: 15,
                                child: Image.asset("assets/images/star_1.2.png"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text(
                                ratingRecommended.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Mulish-Regular",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8E8EA9),
                                ),
                              ),
                            ),
                            Text(
                              '(${reviewRecommended.toString()} reviews)',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Mulish-Regular",
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFC0C0CF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 3.0),
                          child: Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 8,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFB080),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          priceRecommended.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: "Mulish-Regular",
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFF7B2C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const CartCounter(),
            ],
          ),
        ),
      ),
    );
  }
}