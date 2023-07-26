import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_time_provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';
import 'package:sushi_shop_project/view_a_dish_widget/tools/toppings_provider.dart';
import 'PROVIDER/dish_provider.dart';
import 'PROVIDER/quantity_provider.dart';
import 'full_menu_widget/full_menu.dart';
import 'payment_widget/tools/card_details_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderTotalProvider()),
        ChangeNotifierProvider(create: (context) => CardDetailsProvider()),
        ChangeNotifierProvider(create: (context) => OrderTimeProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => ToppingsProvider()),
        ChangeNotifierProvider(create: (context) => QuantityProvider()),
      ],
      child: const MaterialApp(
        home: FullMenu(),
      )
    );
  }
}