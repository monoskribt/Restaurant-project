import 'package:flutter/material.dart';

class PizzaTest extends StatelessWidget {
  const PizzaTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        children: [
          Text("Pizza", style: TextStyle(fontSize: 50),)
        ],
      ),
    );
  }
}
