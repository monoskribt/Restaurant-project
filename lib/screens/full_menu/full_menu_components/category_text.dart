import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String text;
  const CategoryText({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
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
}
