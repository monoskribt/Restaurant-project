import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/order_total_provider.dart';
import 'package:sushi_shop_project/screens/order_status/order_status_components/order_status_card.dart';

class OrderStatusList extends StatefulWidget {
  const OrderStatusList({
    Key? key,
  }) : super(key: key);

  @override
  _OrderStatusListState createState() => _OrderStatusListState();
}

class _OrderStatusListState extends State<OrderStatusList> {
  double itemsTotal = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _calculateItemsTotal();
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final orderMap = orderProvider.orderMap;
    return Column(
      children: orderMap.values.map((order) {
        print('Dish: ${order.name}. Comment: ${order.comment}');
        return OrderStatusCard(
          imageOrderList: order.image,
          titleOrderList: order.name,
          quantity: order.quantity,
          priceOrderList: order.price,
          request: order.comment,
        );
      }).toList(),
    );
  }

  void _calculateItemsTotal() {
    itemsTotal = 0.0;
    final orderProvider = Provider.of<OrderProvider>(context);
    final orderMap = orderProvider.orderMap;

    for (final order in orderMap.values) {
      final quantity = order.quantity;
      final price = order.price;
      final total = quantity * price;
      itemsTotal += total;
    }

    final orderItemsTotalProvider =
        Provider.of<OrderTotalProvider>(context, listen: false);
    orderItemsTotalProvider.updateItemsTotal(itemsTotal);
  }
}
