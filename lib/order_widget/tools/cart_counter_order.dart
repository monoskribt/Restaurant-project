import 'package:flutter/material.dart';

class CartCounterOrder extends StatefulWidget {
  const CartCounterOrder({Key? key}) : super(key: key);

  @override
  State<CartCounterOrder> createState() => _CartCounterOrderState();
}

class _CartCounterOrderState extends State<CartCounterOrder> {
  int numOfItems = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(
          icon: Icons.remove,
          backgroundColor: const Color(0xFFFFF2EA),
          press: () {
            if (numOfItems > 0) {
              setState(() {
                numOfItems--;
              });
            }
          },
          iconColor: const Color(0xFFFF7B2C),
        ),
        Text(
          numOfItems.toString(),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF666687),
          ),
        ),
        buildButton(
          icon: Icons.add,
          backgroundColor: const Color(0xFFFFF2EA),
          press: () {
            setState(() {
              numOfItems++;
            });
          },
          iconColor: const Color(0xFFFF7B2C),
        ),
      ],
    );
  }

  SizedBox buildButton({
    required IconData icon,
    required VoidCallback press,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return SizedBox(
      width: 45,
      height: 45,
      child: FittedBox(
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: backgroundColor,
            padding: EdgeInsets.zero,
            elevation: 0,
          ),
          onPressed: press,
          child: Icon(
            icon,
            size: 35,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}