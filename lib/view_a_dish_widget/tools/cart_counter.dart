import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  final ValueChanged<int> onAdd;
  final ValueChanged<int> onRemove;
  final String dishName;

  const CartCounter({
    Key? key,
    required this.onAdd,
    required this.onRemove,
    required this.dishName,
  }) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 0;

  void _showSnackBar(BuildContext context, int quantity) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    String orderText = numOfItems > 0 ? 'added to order' : 'removed from order';
    final snackBar = SnackBar(
      content: Text(
        numOfItems > 0
            ? '"${widget.dishName}" $orderText: $quantity'
            : '"${widget.dishName}" $orderText',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: "Mulish-Regular",
          color: Color(0xFF666687),
        ),
      ),
      backgroundColor: Colors.grey[300],
      duration: const Duration(seconds: 3),
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(
          icon: Icons.remove,
          backgroundColor: const Color(0xFFEAEAEF),
          press: () {
            if (numOfItems > 0) {
              setState(() {
                numOfItems--;
              });
              widget.onRemove(numOfItems);
              _showSnackBar(context, numOfItems);
            }
          },
          iconColor: const Color(0xFF8E8EA9),
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
            widget.onAdd(numOfItems);
            _showSnackBar(context, numOfItems);
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
            elevation: 1,
          ),
          onPressed: press,
          child: Icon(
            icon,
            size: 30,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
