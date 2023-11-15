import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:sushi_shop_project/features/provider/order_time_provider.dart';
import 'package:sushi_shop_project/screens/drawer_widget/main_drawer.dart';
import 'package:sushi_shop_project/screens/order_status/order_status_components/order_status_bottom_bar.dart';
import 'package:sushi_shop_project/screens/order_status/order_status_components/order_status_dropdown.dart';
import 'package:sushi_shop_project/screens/order_status/order_status_components/order_statuses.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  final GlobalKey<ScaffoldState> orderStatusScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: orderStatusScaffoldKey,
      endDrawer: const MainDrawer(),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFCFCFC),
              Color(0xFFF7F7F7),
              Color(0xFFF7F7F7),
              Color(0xFFF7F7F7),
              Color(0xFFFCFCFC),
            ],
            stops: [0, 0.1004, 0.5156, 0.8958, 1],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 0.03 * screenHeight,
                left: 0.06 * screenWidth,
                right: 0.06 * screenWidth,
              ),
              child: Column(
                children: [
                  buildTopBar(context),
                  const SizedBox(height: 15),
                  //Здесь можно менять значения и будут разные статусы
                  const OrderStatusFirst(orderTime: 15),
                  const SizedBox(height: 15),
                  const OrderDropdown(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x32324705),
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: -2,
                    ),
                    BoxShadow(
                      color: Color(0x0C1A4B0D),
                      offset: Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: IconButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  icon: const Icon(Icons.arrow_back, size: 22),
                  color: const Color(0xFF666687),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/order_menu');
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: BlocBuilder<RestaurantCubit, String>(
                        builder: (context, selectedRestaurant) {
                          return Text(
                            selectedRestaurant,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF8E8EA9),
                              fontFamily: "Mulish-Regular",
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Your order status",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF32324D),
                        fontFamily: "Mulish-Regular",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/images/menu.svg",
            height: 24,
            width: 24,
          ),
          onPressed: () {
            orderStatusScaffoldKey.currentState?.openEndDrawer();
          },
        )
      ],
    );
  }

  OrderStatusBottomBar? _buildBottomNavigationBar(BuildContext context) {
    final orderTimeProvider = Provider.of<OrderTimeProvider>(context);
    return orderTimeProvider.isShowBottomBar
        ? const OrderStatusBottomBar()
        : null;
  }
}
