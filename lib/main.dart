import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/bloc/filter_bloc.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';
import 'package:sushi_shop_project/features/provider/card_details_provider.dart';
import 'package:sushi_shop_project/features/provider/email_controller_provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/order_time_provider.dart';
import 'package:sushi_shop_project/features/provider/order_total_provider.dart';
import 'package:sushi_shop_project/features/provider/request_provider.dart';
import 'package:sushi_shop_project/features/provider/toppings_provider.dart';
import 'package:sushi_shop_project/features/provider/user_contact_details_provider.dart';
import 'package:sushi_shop_project/models/user_contact_details.dart';
import 'package:sushi_shop_project/screens/contacts/contacts_widget.dart';
import 'package:sushi_shop_project/screens/drawer_widget/main_drawer.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu.dart';
import 'package:sushi_shop_project/screens/order/order_menu.dart';
import 'package:sushi_shop_project/screens/order_status/order_status.dart';
import 'package:sushi_shop_project/screens/payment/payment.dart';
import 'package:sushi_shop_project/screens/payment_confirmation/payment_confirmation.dart';
import 'package:sushi_shop_project/screens/user_contact_details/user_contact_details.dart';



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
        ChangeNotifierProvider(create: (context) => UserContactDetailsProvider()),
        ChangeNotifierProvider(create: (context) => EmailControllerProvider()),
        BlocProvider<SortingDishesCubit>(create: (context) => SortingDishesCubit()),
        BlocProvider<RestaurantCubit>(create: (context) => RestaurantCubit()),
        BlocProvider<FilterBloc>(create: (context) => FilterBloc()..add(FilterLoad())),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const FullMenu(),
          '/main_drawer': (context) => const MainDrawer(),
          '/contacts': (context) => const Contacts(),
          '/order_menu': (context) => OrderMenu(),
          '/user_contact': (context) => const UserContact(),
          '/order_status': (context) => const OrderStatus(),
          '/payment': (context) => const Payment(),
          '/payment_confirmation': (context) => PaymentConfirmation(),
        },
        initialRoute: '/',
      )
    );
  }
}