import 'package:flutter/material.dart';
import 'package:sushi_shop_project/filters_widget/filters.dart';
import 'full_menu_widget/full_menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FullMenu(),
      initialRoute: '/',
      routes: {

      },
    );
  }
}