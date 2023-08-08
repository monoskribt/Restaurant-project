import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_time_provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';
import 'package:sushi_shop_project/view_a_dish_widget/tools/toppings_provider.dart';
import 'PROVIDER/dish_provider.dart';
import 'PROVIDER/quantity_provider.dart';
import 'bloc/filter_bloc.dart';
import 'cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';
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
        BlocProvider<SortingDishesCubit>(create: (context) => SortingDishesCubit()),
        BlocProvider<FilterBloc>(create: (context) => FilterBloc()..add(FilterLoad())),
      ],
      child: const MaterialApp(
        home: FullMenu(),
      )
    );
  }
}