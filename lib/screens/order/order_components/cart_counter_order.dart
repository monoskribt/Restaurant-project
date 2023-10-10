import 'package:flutter/material.dart';


class CartCounterOrder extends StatefulWidget {
  final int quantity;
  final ValueChanged<int> onChanged;

  const CartCounterOrder({
    Key? key,
    required this.quantity,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CartCounterOrder> createState() => _CartCounterOrderState();
}

class _CartCounterOrderState extends State<CartCounterOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(
          icon: Icons.remove,
          backgroundColor: const Color(0xFFFFF2EA),
          press: () {
            if (widget.quantity > 1) {
              widget.onChanged(widget.quantity - 1);
            }
          },
          iconColor: const Color(0xFFFF7B2C),
        ),
        Text(
          widget.quantity.toString(),
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
            widget.onChanged(widget.quantity + 1);
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
