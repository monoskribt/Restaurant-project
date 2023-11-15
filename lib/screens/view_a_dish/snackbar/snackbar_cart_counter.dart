import 'package:flutter/material.dart';

class SnackbarCartCounter extends StatefulWidget {
  final ValueChanged<int> onAdd;
  final ValueChanged<int> onRemove;
  final String dishName;

  const SnackbarCartCounter({
    Key? key,
    required this.onAdd,
    required this.onRemove,
    required this.dishName,
  }) : super(key: key);

  @override
  State<SnackbarCartCounter> createState() => _SnackbarCartCounterState();
}

class _SnackbarCartCounterState extends State<SnackbarCartCounter> {
  int numOfItems = 0;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(
            icon: Icons.remove,
            backgroundColor: const Color(0xFFEAEAEF),
            onPressed: _decrement,
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
          _buildButton(
            icon: Icons.add,
            backgroundColor: const Color(0xFFFFF2EA),
            onPressed: _increment,
            iconColor: const Color(0xFFFF7B2C),
          ),
        ],
      ),
    );
  }

  void _decrement() {
    if (numOfItems > 0) {
      setState(() {
        numOfItems--;
      });
      widget.onRemove(numOfItems);
      _showSnackBar(numOfItems);
    }
  }

  void _increment() {
    setState(() {
      numOfItems++;
    });
    widget.onAdd(numOfItems);
    _showSnackBar(numOfItems);
  }

  SizedBox _buildButton({
    required IconData icon,
    required VoidCallback onPressed,
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
          onPressed: onPressed,
          child: Icon(
            icon,
            size: 30,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(int quantity) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    String orderText = numOfItems > 0 ? 'added to order' : 'removed from order';
    final snackBar = SnackBar(
      content: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
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
}
