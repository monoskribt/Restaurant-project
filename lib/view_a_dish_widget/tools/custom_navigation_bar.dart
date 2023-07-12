import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  final double priceView;
  const CustomBottomBar({
    Key? key,
    required this.priceView,
  }) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int quantity = 0;
  double totalPrice = 0;

  void updateTotalPrice(int newQuantity) {
    setState(() {
      quantity = newQuantity;
      totalPrice = widget.priceView * newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55,
            padding: const EdgeInsets.only(top: 17, bottom: 17, left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFF6F6F9),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (quantity > 0) {
                      setState(() {
                        quantity--;
                        totalPrice = widget.priceView * quantity;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Color(0xFFDCDCE4),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  quantity.toString(),
                  style: const TextStyle(color: Color(0xFFA5A5BA), fontSize: 17),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity++;
                      totalPrice = widget.priceView * quantity;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF8E8EA9),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 200,
              height: 60,
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF615793),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Add to order ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Mulish-Regular",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Mulish-Regular",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
