import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_restaurant/restaurant_cubit.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/order_total_provider.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu.dart';
import 'package:sushi_shop_project/screens/payment/payment.dart';

class PaymentConfirmation extends StatelessWidget {
  const PaymentConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final orderTotalProvider =
        Provider.of<OrderTotalProvider>(context, listen: false);

    return Scaffold(
      body: _buildBody(context, orderProvider, orderTotalProvider),
    );
  }

  Widget _buildBody(BuildContext context, OrderProvider orderProvider,
      OrderTotalProvider orderTotalProvider) {
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
      child: Column(
        children: [
          _buildTopBar(context),
          Expanded(
            child: _buildMainContent(),
          ),
          _buildContinueButton(orderProvider, orderTotalProvider),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 24, left: 24),
        child: Row(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Payment(),
                          ),
                        );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FullMenu()),
                );
              },
            )
          ],
        ));
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
            "Thank you for your payment!",
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
      OrderProvider orderProvider, OrderTotalProvider orderTotalProvider) {
    return InkWell(
      onTap: () {
        orderTotalProvider.clear();
        orderProvider.orderMap.clear();
        print("All clear");
      },
      child: Container(
        width: 340,
        height: 55,
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
