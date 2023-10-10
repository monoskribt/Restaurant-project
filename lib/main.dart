import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/bloc/filter_bloc.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';
import 'package:sushi_shop_project/features/provider/card_details_provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/order_time_provider.dart';
import 'package:sushi_shop_project/features/provider/order_total_provider.dart';
import 'package:sushi_shop_project/features/provider/request_provider.dart';
import 'package:sushi_shop_project/features/provider/toppings_provider.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu.dart';



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
        ChangeNotifierProvider(create: (context) => RequestProvider()),
        BlocProvider<SortingDishesCubit>(create: (context) => SortingDishesCubit()),
        BlocProvider<FilterBloc>(create: (context) => FilterBloc()..add(FilterLoad())),
      ],
      child: const MaterialApp(
        home: FullMenu(),
      )
    );
  }
}