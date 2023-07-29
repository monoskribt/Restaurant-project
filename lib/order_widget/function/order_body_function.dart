import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_widget/tools/dismiss.dart';
import 'package:sushi_shop_project/order_widget/util/order_menu_card.dart';
import '../../PROVIDER/dish_provider.dart';

class OrderBody extends StatelessWidget {
  OrderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderMap = Provider.of<OrderProvider>(context).orderMap;

    return SizedBox(
      width: 360,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: orderMap.length,
        itemBuilder: (context, index) {
          final order = orderMap.values.toList()[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 0),
            child: SizedBox(
              height: 120,
              width: 360,
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
          );
        },
      ),
    );
  }
}
