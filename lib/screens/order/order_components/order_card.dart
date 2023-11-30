import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/order_provider.dart';
import 'package:Foodbox/screens/order/order_components/cart_counter_order.dart';
import 'package:provider/provider.dart';


class OrderCard extends StatelessWidget {
  final String imageOrder;
  final String nameOrder;
  final double priceOrder;
  int quantityOrder;

  OrderCard({
    Key? key,
    required this.imageOrder,
    required this.nameOrder,
    required this.priceOrder,
    required this.quantityOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x32324705),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Color(0x0C1A4B0D),
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildImage(context),
          SizedBox(width: 0.03 * screenWidth),
          buildOrderDetails(context),
          CartCounterOrder(
            quantity: quantityOrder,
            onChanged: (newQuantity) {
              final orderProvider = Provider.of<OrderProvider>(context, listen: false);
              orderProvider.updateQuantity(nameOrder, newQuantity);
            },
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Image.asset(
      imageOrder,
      width: 0.3 * screenWidth,
      height: 0.3 * screenHeight,
    );
  }

  Widget buildOrderDetails(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                nameOrder,
                style: TextStyle(
                  fontSize: 0.02 * screenHeight,
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF32324D),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
          buildPrice(),
        ],
      ),
    );
  }

  Widget buildPrice() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 3.0),
          child: Text(
            "\$",
            style: TextStyle(
              fontSize: 8,
              fontFamily: "Mulish-Regular",
              fontWeight: FontWeight.w700,
              color: Color(0xFFFFB080),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          priceOrder.toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 15,
            fontFamily: "Mulish-Regular",
            fontWeight: FontWeight.w700,
            color: Color(0xFFFF7B2C),
          ),
        ),
      ],
    );
  }
}
