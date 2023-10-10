import 'package:flutter/material.dart';

class BJUCard extends StatelessWidget {
  final int kcal, grams, proteins, carbs, fats;

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
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildBjuRow("kcal", kcal),
                buildBjuRow("grams", grams),
                buildBjuRow("proteins", proteins),
                buildBjuRow("carbs", carbs),
                buildBjuRow("fats", fats),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBjuRow(String label, int value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
              fontSize: 14,
              fontFamily: "Mulish-Regular",
              fontWeight: FontWeight.w600,
              color: Color(0xFF3A2D78)),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: "Mulish-Regular",
            fontWeight: FontWeight.w600,
            color: Color(0xFF8E8EA9),
          ),
        )
      ],
    );
  }
}
