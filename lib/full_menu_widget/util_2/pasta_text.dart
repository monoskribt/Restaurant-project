import 'package:flutter/material.dart';

class PastaText extends StatelessWidget {
  const PastaText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Pasta",
          style: TextStyle(
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