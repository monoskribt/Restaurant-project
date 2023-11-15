import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String text;
  const CategoryText({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 0.0215 * screenHeight,
            fontWeight: FontWeight.w600,
            fontFamily: "Mulish-Regular",
            color: const Color(0xFF666687),
          ),
        ),
      ],
    );
  }
}
