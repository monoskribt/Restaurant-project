import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/PROVIDER/dish_provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';
import 'package:sushi_shop_project/order_status_widget/util/order_list_card.dart';

class OrderListBody extends StatefulWidget {
  const OrderListBody({
    Key? key,
  }) : super(key: key);

  @override
  _OrderListBodyState createState() => _OrderListBodyState();
}

class _OrderListBodyState extends State<OrderListBody> {
  double itemsTotal = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    calculateItemsTotal();
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final orderMap = orderProvider.orderMap;
    return Column(
      children: orderMap.values.map((order) {
        return OrderListCard(
          imageOrderList: order.image,
          titleOrderList: order.name,
          quantity: order.quantity,
          priceOrderList: order.price,
        );
      }).toList(),
    );
  }

  void calculateItemsTotal() {
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
