import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_time_provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';
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
      ],
      child: MaterialApp(
        home: const FullMenu(),
      )
    );
  }
}