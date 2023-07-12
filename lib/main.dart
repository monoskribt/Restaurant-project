import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';
import 'full_menu_widget/full_menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderTotalProvider(),
      child: const MaterialApp(
        home: FullMenu(),
      ),
    );
  }
}
