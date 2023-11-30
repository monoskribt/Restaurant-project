import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/order_provider.dart';
import 'package:Foodbox/models/order_model.dart';
import 'package:Foodbox/screens/order/order_components/dismiss.dart';
import 'package:Foodbox/screens/order/order_components/order_card.dart';
import 'package:provider/provider.dart';




class OrderListView extends StatelessWidget {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderMap = Provider.of<OrderProvider>(context).orderMap;
    if (orderMap.isEmpty) {

      return Container();
    }

    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: orderMap.length,
        itemBuilder: (context, index) {
          final order = orderMap.values.toList()[index];
          return buildOrderCard(context, order);
        },
      ),
    );
  }

  Widget buildOrderCard(BuildContext context, OrderModel order) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, left: 0),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Dismissible(
            key: Key(order.name),
            direction: DismissDirection.endToStart,
            secondaryBackground: const DismissBackground(
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            background: const DismissBackground(
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            onDismissed: (direction) {
              final orderProvider =
              Provider.of<OrderProvider>(context, listen: false);
              orderProvider.removeFromOrder(order.name);
            },
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color(0xFFFFB01D), Colors.transparent],
                ),
              ),
              child: SizedBox(
                child: OrderCard(
                  imageOrder: order.image,
                  nameOrder: order.name,
                  priceOrder: order.price,
                  quantityOrder: order.quantity,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
