import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final List orderList = [
    {
      "image": "assets/images/most_popular_1.png",
      "title": "Avocado and Egg Toast",
      "quantity": 2,
      "price": 10.00,
    },
    {
      "image": "assets/images/recommended_sides_1.png",
      "title": "Curry Salmon",
      "quantity": 2,
      "price": 10.00,
    },
    {
      "image": "assets/images/recommended_sides_2.png",
      "title": "Yogurt and fruits",
      "quantity": 2,
      "price": 5.00,
    },
  ];

  double itemsTotal = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    calculateItemsTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orderList.map((list) {

        return OrderListCard(
          imageOrderList: list["image"],
          titleOrderList: list["title"],
          quantity: list["quantity"],
          priceOrderList: list["price"],
        );
      }).toList(),
    );
  }


  void calculateItemsTotal() {
    itemsTotal = 0.0;
    for (final list in orderList) {
      final quantity = list["quantity"] as int;
      final price = list["price"] as double;
      final total = quantity * price;
      itemsTotal += total;
    }
    final orderItemsTotalProvider = Provider.of<OrderTotalProvider>(context, listen: false);
    orderItemsTotalProvider.updateItemsTotal(itemsTotal);
  }
}
