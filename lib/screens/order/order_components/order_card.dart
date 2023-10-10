import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/screens/order/order_components/cart_counter_order.dart';

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
    return Container(
      width: 360,
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
      child: SizedBox(
        width: 360,
        child: Row(
          children: [
            buildImage(),
            buildOrderDetails(),
            CartCounterOrder(
              quantity: quantityOrder,
              onChanged: (newQuantity) {
                final orderProvider = Provider.of<OrderProvider>(context, listen: false);
                orderProvider.updateQuantity(nameOrder, newQuantity);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return SizedBox(
      width: 120,
      child: Image.asset(
        imageOrder,
        width: 140,
        height: 140,
      ),
    );
  }

  Widget buildOrderDetails() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                nameOrder,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF32324D),
                ),
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
