import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Foodbox/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:Foodbox/features/provider/order_provider.dart';
import 'package:Foodbox/features/provider/order_total_provider.dart';
import 'package:provider/provider.dart';

import '../drawer_widget/main_drawer.dart';

class PaymentConfirmation extends StatefulWidget {
  PaymentConfirmation({Key? key}) : super(key: key);

  @override
  State<PaymentConfirmation> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  final GlobalKey<ScaffoldState> paymentConfirmationScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final orderTotalProvider =
        Provider.of<OrderTotalProvider>(context, listen: false);

    return LayoutBuilder(builder: (builder, constraints) {
      double buttonWidth = constraints.maxWidth;
      double buttonHeight = constraints.maxHeight;
      return Scaffold(
        key: paymentConfirmationScaffoldKey,
        endDrawer: const MainDrawer(),
        body: _buildBody(context, orderProvider, orderTotalProvider, buttonWidth, buttonHeight),
      );
    });
  }

  Widget _buildBody(BuildContext context, OrderProvider orderProvider,
      OrderTotalProvider orderTotalProvider, double buttonWidth, double buttonHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
        child: Padding(
          padding: EdgeInsets.only(
              top: 0.03 * screenHeight,
              left: 0.06 * screenWidth,
              right: 0.06 * screenWidth,
              bottom: 0
          ),
          child: Column(
            children: [
              buildTopBar(context),
              Expanded(
                child: _buildMainContent(),
              ),
              _buildContinueButton(orderProvider, orderTotalProvider, buttonWidth, buttonHeight, context),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  icon: const Icon(Icons.arrow_back, size: 22),
                  color: const Color(0xFF666687),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
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
                      "Checkout",
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
            paymentConfirmationScaffoldKey.currentState?.openEndDrawer();
          },
        )

      ],
    );
  }

  Widget _buildMainContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/wallet_big.png"),
          const SizedBox(height: 18),
          const Text(
            "Woohoo!",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              fontFamily: "Mulish-Regular",
              color: Color(0xFF32324D),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Thanks for your order!",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: "Mulish-Regular",
              color: Color(0xFF8E8EA9),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContinueButton(
      OrderProvider orderProvider, OrderTotalProvider orderTotalProvider, double buttonWidth, double buttonHeight, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      },
      child: Container(
        width: buttonWidth / 1.3,
        height: buttonHeight / 14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF615793),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Mulish-Regular",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
