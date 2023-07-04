import 'package:flutter/material.dart';

class BJUCard extends StatelessWidget {
  final dynamic kcal, grams, proteins, carbs, fats;

  const BJUCard({
    Key? key,
    required this.kcal,
    required this.grams,
    required this.proteins,
    required this.carbs,
    required this.fats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: Colors.grey.withOpacity(0.1),
                width: 1.2,
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      kcal.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                          fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3A2D78)
                      ),
                    ),
                    const Text(
                      "kcal",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8EA9),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      grams.toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3A2D78)
                      ),
                    ),
                    const Text(
                      "grams",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8EA9),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      proteins.toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3A2D78)
                      ),
                    ),
                    const Text(
                      "proteins",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8EA9),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      carbs.toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3A2D78)
                      ),
                    ),
                    const Text(
                      "carbs",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8EA9),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      fats.toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3A2D78)
                      ),
                    ),
                    const Text(
                      "fats",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8EA9),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}